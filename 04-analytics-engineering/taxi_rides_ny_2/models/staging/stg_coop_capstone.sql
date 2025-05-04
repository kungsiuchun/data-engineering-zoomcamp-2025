{{
    config(
        materialized='table'
    )
}}

with coop_data as 
(
  select *,
    row_number() over(partition by unique_row_id) as rn,
    replace("Impressions",',','') as "Impressions Replaced",
    replace("Viewable Impressions",',','') as "Viewable Impressions Replaced",
    replace("Measurable Impressions",',','') as "Measurable Impressions Replaced"
  from {{ source('staging','coop_da_capstone_data') }}
  Where "Audience Segment" IS NOT NULL
),
coop_data_transformed as (
select
    -- identifiers and dimension
    unique_row_id,
    replace( replace("Audience Segment",'»','>'), '�', '') as "audience_segment",
    "Creative Size" as "creative_size",
    "Creative Messaging" as "creative_messaging",
    "Location" as "location",
    "App/URL" as "app_or_url",
    "Exchange" as "exchange",
    "Device Make" as "device_make",
    
    -- ad performance metric
    {{ dbt.safe_cast("\"Impressions Replaced\"", api.Column.translate_type("numeric")) }} as "impressions",
    {{ dbt.safe_cast("\"Clicks\"", api.Column.translate_type("numeric")) }} as "clicks",
    {{ dbt.safe_cast("\"Viewable Impressions Replaced\"", api.Column.translate_type("numeric")) }} as "viewable_impressions",
    {{ dbt.safe_cast("\"Measurable Impressions Replaced\"", api.Column.translate_type("numeric")) }} as "measurable_impressions",
    {{ dbt.safe_cast("\"Total Conversions\"", api.Column.translate_type("numeric")) }} as "total_conversions",
    {{ dbt.safe_cast("\"Gross Cost\"", api.Column.translate_type("numeric")) }} as "gross_cost",

    -- file name and cdate
    filename,
    cdate
from coop_data
where rn = 1
)

select 
  *,
  {{ count_greater_than('audience_segment') }} as "audience_segment_level",
  {{ categorize_audience_segment('audience_segment') }} as "audience_category"
from coop_data_transformed




-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
-- {% if var('is_test_run', default=true) %}

--   limit 100

-- {% endif %}