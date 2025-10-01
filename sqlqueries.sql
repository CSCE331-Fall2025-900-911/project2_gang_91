-- In SQL --

-- 1.) Show all ingredients and their quantities
SELECT * FROM ingredients;

-- 2.) Show all supplies and their quantities
SELECT * FROM supplies;

-- 3.) Show all menu items and their prices
SELECT * FROM menu_items;

-- 4.) List all ingredients used in a specific menu item
SELECT ingredient_name
FROM menu_item_ingredients
WHERE menu_item_name = 'Classic Pearl Milk Tea';

-- 5.) Count how many ingredients each menu item has
SELECT menu_item_name, COUNT(ingredient_name) AS num_ingredients
FROM menu_item_ingredients
GROUP BY menu_item_name
ORDER BY num_ingredients DESC;

-- 6.) Find all menu items that include 'milk'
SELECT DISTINCT menu_item_name
FROM menu_item_ingredients
WHERE ingredient_name LIKE '%milk%';

-- 7.) Total quantity of ingredients available for each menu item
SELECT mi.name AS menu_item, SUM(i.quantity) AS total_ingredient_qty
FROM menu_items mi
JOIN menu_item_ingredients mii ON mi.name = mii.menu_item_name
JOIN ingredients i ON mii.ingredient_name = i.name
GROUP BY mi.name
ORDER BY total_ingredient_qty DESC;

-- 8.) Show all drinks from Drinks table
SELECT * FROM drinks;

-- 9.) Show all toppings from Toppings table
SELECT * FROM toppings;

-- 10.) Show the 5 most recent orders
SELECT *
FROM Orders
ORDER BY Order_Timestamp DESC
LIMIT 5;

-- 11.) Total sales per drink (Drink_Price + Topping_Price)
SELECT 
    Drink_Name,
    ROUND(SUM(Drink_Price + Topping_Price)::numeric, 2) AS total_sales
FROM Orders
GROUP BY Drink_Name
ORDER BY total_sales DESC;

-- 12.) Count how many times each topping was used
SELECT Topping_Used, COUNT(*) AS usage_count
FROM Orders
GROUP BY Topping_Used
ORDER BY usage_count DESC;


-- Special Query #1: Weekly Sales History --
-- Count orders per week. --
SELECT 
    EXTRACT(WEEK FROM Order_Timestamp) AS week_number,
    COUNT(*) AS num_orders
FROM Orders
GROUP BY week_number
ORDER BY week_number;

-- Special Query #2: Realistic Sales History --
-- Count orders and sum total per hour. --
SELECT 
    EXTRACT(HOUR FROM Order_Timestamp) AS order_hour,
    COUNT(*) AS num_orders,
    SUM(Drink_Price + Topping_Price) AS total_sales
FROM Orders
GROUP BY order_hour
ORDER BY order_hour;

-- Special Query #3: Peak Sales Day --
-- Top 10 days by total sales. --
SELECT 
    Order_Timestamp::DATE AS order_day,
    SUM(Drink_Price + Topping_Price) AS total_sales
FROM Orders
GROUP BY order_day
ORDER BY total_sales DESC
LIMIT 10;