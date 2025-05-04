{% macro categorize_audience_segment(audience_segment) %}
CASE
    -- Sociodemographic
    WHEN {{ audience_segment }} ILIKE ANY (ARRAY[
        '%Sociodemographic%',
        '%PRIZM%',
        '%P$YCLE%',
        '%ConneXions%',
        '%Household Income%',
        '%Homeowner Status%',
        '%Renter%',
        '%Age%',
        '%Dwelling Type%',
        '%Dwelling Size%',
        'Mobile - US > Demographics > Finance%',
        'Mobile - US > Demographics > Education%',
        'Premium Gender%',
        'OnAudience > Intent > Education%',
        'OnAudience > Intent > Baby & Toddler%',
        'OnAudience > Intent > Family & Relationships%',
        'US > Demographic > Family%',
        'US > Premium Gender%',
        'Online Behavior>United States>People and Society>Seniors and Retirement%',
        'Online Behavior>United States>People and Society>Family and Relationships%',
        'Online Behavior>United States>People and Society>Millennials%',
        'Online Behavior>United States>Validated Demographic > Gender%',
        'US Home > Property Type%',
        'Online Behavior>United States>Life Event>New Parent%',
        'Online Behavior>United States>Life Event>Movers%',
        'Online Behavior>United States>Life Event>Wedding Planning%'
    ]) THEN 'Sociodemographic'

    -- Interest Propensities
    WHEN {{ audience_segment }} ILIKE ANY (ARRAY[
        'US > Interest Propensities%',
        '%Music > Hip Hop and Rap%',
        '%Music > Country%',
        '%Music > Classic Rock%',
        '%Insurance%',
        '%Food and Drink > American Cuisine%',
        '%Celebrities%',
        '%National News%',
        '%Local News%',
        '%International News%',
        '%Financial Aid%',
        '%Fashion%',
        '%Ecommerce%',
        '%College Life%',
        '%TV and Movies%',
        'US Interest > Computers%',
        'US Interest > Consumer Electronics%'
    ]) THEN 'Interest Propensities'

    -- Reach/Propensity Models
    WHEN {{ audience_segment }} ILIKE ANY (ARRAY[
        'US > Reach > Propensity Models%',
        '%Young Adult Clothing Shoppers%',
        '%Real Estate%',
        '%Online > Pets%',
        '%Online > Home Office%',
        '%Electronics and Gadgets%',
        '%Luxury%',
        '%Lifestyle%',
        '%Household Consumer Expenditures%',
        '%Hobbies and Interest%',
        'OnAudience > Intent > Real Estate%',
        'US > Composite Segment > Women Born to Shop%',
        'US >Connected Impulse-Shopper Audience%',
        'US >Green Consumer Audience%',
        'US >Made In America Audience%',
        'US >Rural Improvement Fanatic%',
        'US > Financially in Charge > Performance Score%',
        'US Buying Channel Preference > Online%',
        'US > Response Performance > Direct Marketing%',
        'Purchase Behaviors%',
        'Transactional > Q2%',
        'Transactional > Q3%',
        'Purchase-Based%'
    ]) THEN 'Reach/Propensity Models'

    -- Travel
    WHEN {{ audience_segment }} ILIKE ANY (ARRAY[
        '%Travel >%',
        'Mobile - US > Travel%',
        'Lotame > Travel%',
        'OnAudience > Intent > Travel%',
        'Online Behavior>United States>Travel%',
        'Online Behavior>United States>Intent > Travel%',
        'Travel and Tourism%',
        'Travel%'
    ]) THEN 'Travel'

    -- Shopping/Consumer Behavior
    WHEN {{ audience_segment }} ILIKE ANY (ARRAY[
        '%Multibuyer Behaviors%',
        'US Mail Order Buyer%',
        '%Online Shoppers%',
        '%Shopping > Brand%',
        '%Quality-First Shopper%',
        '%Price-Driven Traditionalist%',
        'Lotame > Style, Fashion & Clothing%',
        'Lotame > Offline CPG Purchasers%',
        'Made In America Enthusiast%',
        'OnAudience > Intent > Toys & Games%',
        'OnAudience > Intent > Auto%',
        'OnAudience > Intent > Animals & Pet%',
        'OnAudience > Intent > Apparel%',
        'Online Behavior>United States>Intent > Shopping%',
        'Online Behavior>United States>Autos and Vehicles%',
        'Online Behavior>United States>Intent > Auto Buyers%',
        'US > Brand Propensities > Apparel%',
        'US > Brand Propensities > Automotive%',
        'US > Brand Propensities > Big Box%',
        'US > Brand Propensities > Electronics%',
        'US > Brand Propensities > Food and Drug%',
        'US > Brand Propensities > Health > Beauty and Cosmetics%',
        'US > Brand Propensities > Home and Household Goods%',
        'US > Brand Propensities > Kids Products%',
        'US > Brand Propensities > Restaurants and Dining%',
        'US > Automotive > Auto Loyalists and Defectors%',
        'US > AUTO > Auto Car Purchase Next Year%',
        'US > AUTO > Decision Maker for Auto Purchase%',
        'US > AUTO > Primary Vehicle > New or Used%',
        'US > AUTO > Primary Vehicle > Owned or Leased > Company Car%',
        'Online Behavior>United States>Intent > Services>Pets%',
        'Retail%'
    ]) THEN 'Shopping/Consumer Behavior'

    -- Food and Dining
    WHEN {{ audience_segment }} ILIKE ANY (ARRAY[
        'Mobile - US > Food > Restaurant%',
        '%Food and Drinks%',
        '%Coffee Connoisseurs%',
        '%Eats at%',
        'OnAudience > Intent > Food & Drink%',
        'Online Behavior>United States>Food and Drink%',
        'US Interest > Cooking%',
        'US > Home and Garden Interests > Cooking%',
        'Restaurants%',
        'Online Behavior>United States>Intent > Services>Restaurants%'
    ]) THEN 'Food and Dining'

    -- Sports and Recreation
    WHEN {{ audience_segment }} ILIKE ANY (ARRAY[
        'Mobile - US > Sports%',
        'Media and Entertainment > Sports and Recreational Activities%',
        '%UFC Fans%',
        '%NASCAR%',
        '%Olympics%',
        'OnAudience > Intent > Sporting Goods%',
        'Online Behavior>United States>Sports%',
        'Online Behavior>United States>Intent > Shopping>Sports and Outdoors%'
    ]) THEN 'Sports and Recreation'

    -- Technology and Devices
    WHEN {{ audience_segment }} ILIKE ANY (ARRAY[
        'Mobile - US > Device Ownership%',
        'Lotame > Technology%',
        '%Social Media > Likely Behavior%',
        'Media and Entertainment > Consumer Entertainment Technology%',
        'OnAudience > Intent > Electronics%',
        'OnAudience > Intent > Software > Video Game Software%',
        'Tech Enthusiasts%',
        'Telecommunications (Telco)%',
        'Telecommunications and Mobile Tech%',
        'Mobile - US > Automotive%',
        'Mobile - US > Gamers%',
        'Online Behavior>United States>Internet and Telecom%',
        'Online Behavior>United States>The Changing Consumer>Internet Connection%',
        'Online Behavior>United States>Online Communities%',
        'Lotame > Social Media%'
    ]) THEN 'Technology and Devices'

    -- Media and Entertainment
    WHEN {{ audience_segment }} ILIKE ANY (ARRAY[
        'Media and Entertainment > Television%',
        'Media and Entertainment > Connected TV%',
        'Media and Entertainment > Audio and Video Streaming%',
        'Media and Entertainment > Movies%',
        'Media and Entertainment > Music%',
        'Media and Entertainment > Gaming%',
        'Media and Entertainment > News and Current Events%',
        'Media and Entertainment > Events and Attractions%',
        'Media & Entertainment%',
        'Media and Entertainment%',
        'OnAudience > Interest > Arts & Entertainment%',
        'Premium Magazine Enthusiasts%',
        'OnAudience > Intent > Books & Literature%',
        'OnAudience > Intent > News%',
        'Online Behavior>United States>Arts and Entertainment%',
        'Online Behavior>United States>News%',
        'Online Behavior>United States>Games%',
        'US > Entertainment and Pastimes%',
        'US > Premium Entertainment and Pastimes%',
        'US > Brand Propensities > Media and Entertainment%',
        'Online Behavior>United States>The Changing Consumer>Trending TV Shows%',
        'Online Behavior>United States>The Changing Consumer>Streaming Services%',
        'Online Behavior>United States>Intent > Services>Arts and Entertainment%'
    ]) THEN 'Media and Entertainment'

    -- Business and Finance
    WHEN {{ audience_segment }} ILIKE ANY (ARRAY[
        'Mobile - US > Financial Services%',
        'Lotame > Personal Finance%',
        'OnAudience > Interest > Business%',
        'Media Source > LBDigital > Open For Business B2B%',
        'OnAudience > Intent > Business%',
        'OnAudience > Intent > Finance%',
        'Online Behavior>United States>Finance%',
        'Online Behavior>United States>Intent > Financial Intent%',
        'Online Behavior>United States>B2B%',
        'US > B2B%',
        'US Financial%',
        'US > Financially in Charge%'
    ]) THEN 'Business and Finance'

    -- Lifestyle and Hobbies
    WHEN {{ audience_segment }} ILIKE ANY (ARRAY[
        'Mobile Audience > Lifestyle > Arts Enthusiasts%',
        'US > Rural Improvement Fanatic%',
        'OnAudience > Intent > Home & Garden%',
        'OnAudience > Intent > Health & Fitness%',
        'Online Behavior>United States>Beauty and Fitness%',
        'Online Behavior>United States>Home and Garden%',
        'Online Behavior>United States>Intent > Shopping>Home and Garden%',
        'Online Behavior>United States>Intent > Shopping>Home Improvement%',
        'Online Behavior>United States>Hobbies and Leisure%',
        'US Health and Fitness%',
        'US > Health and Wellbeing%',
        'US > Home and Garden Interests > House and Garden Merchandise Buyers%',
        'US > Home Renovation%',
        'US Interest > Home > Home Improvement%'
    ]) THEN 'Lifestyle and Hobbies'

    -- Other/Specific Audiences
    WHEN {{ audience_segment }} ILIKE ANY (ARRAY[
        'Media Source > LBDigital%',
        'Media Source%',
        'OnAudience > Intent%',
        'OnAudience%',
        'OnAudience > Intent > Law & Government%',
        'Online Behavior>United States>Law and Government%',
        'Online Behavior>United States>The Changing Consumer%',
        'Online Behavior>United States>Jobs and Education%',
        'Online Behavior>United States>Life Event%',
        'Online Behavior>United States>Intent > Services>Photography%'
    ]) THEN 'Other/Specific Audiences'

    -- Fallback
    ELSE 'Uncategorized'
END
{% endmacro %}