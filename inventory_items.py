# inventory_items.py

# Boba shop ingredients
ingredients = {
    "black_tea": 500,
    "green_tea": 444,
    "honey_tea": 500,
    "thai_tea": 284,
    "coffee": 40,
    "milk": 152,
    "tapioca_pearl": 324,
    "pudding": 260,
    "honey_jelly": 355,
    "coconut_milk": 392,
    "strawberry_syrup": 35,
    "mango_syrup": 232,
    "matcha_powder": 34,
    "oreo_crush": 322,
    "brown_sugar_syrup": 393,
    "honey": 485,
    "lemonade": 493,
    "taro_syrup": 320,
    "red_bean": 488,
    "cream": 130,
    "ice": 59,
    "blender": 10,
    "peach_syrup": 50
}

# Boba shop supplies
supplies = {
    "cups": 144,
    "lids": 96,
    "wide_straws": 171,
    "napkins": 149,
    "to_go_bags": 67
}

# Boba shop menu_items
menu_items = {
    "Honey Pearl Milk Tea": ["honey_tea", "milk", "tapioca_pearl", "ice"],
    "Mango Green Milk Tea": ["green_tea", "milk", "mango_syrup", "tapioca_pearl", "ice"],
    "Coffee Creama": ["coffee", "milk", "cream", "ice"],
    "Thai Pearl Milk Tea": ["thai_tea", "milk", "tapioca_pearl", "ice"],
    "Classic Tea": ["black_tea", "ice"],
    "Honey Tea": ["black_tea", "honey", "ice"],
    "Peach Tea with Honey Jelly": ["black_tea", "peach_syrup", "honey_jelly", "ice"],
    "Honey Lemonade": ["lemonade", "honey", "ice"],
    "Mango Green Tea": ["green_tea", "mango_syrup", "ice"],
    "Tiger Boba": ["black_tea", "milk", "brown_sugar_syrup", "tapioca_pearl", "ice"],
    "Halo Halo": ["milk", "tapioca_pearl", "red_bean", "pudding", "ice"],
    "Strawberry Coconut": ["strawberry_syrup", "coconut_milk", "ice", "blender"],
    "Oreo Ice Blended": ["oreo_crush", "milk", "tapioca_pearl", "ice", "blender"],
    "Taro Ice Blended": ["taro_syrup", "milk", "pudding", "ice", "blender"],
    "Mango Matcha Fresh Milk": ["matcha_powder", "milk", "mango_syrup", "ice"],
    "Strawberry Matcha Fresh Milk": ["matcha_powder", "milk", "strawberry_syrup", "ice"]
}

# Boba shop menu prices
menu_prices = {
    "Classic Tea": 4.75,
    "Honey Tea": 4.95,
    "Honey Pearl Milk Tea": 6.15,
    "Mango Green Milk Tea": 6.75,
    "Coffee Creama": 6.75,
    "Thai Pearl Milk Tea": 6.50,
    "Peach Tea with Honey Jelly": 6.40,
    "Honey Lemonade": 5.50,
    "Mango Green Tea": 5.95,
    "Tiger Boba": 6.75,
    "Halo Halo": 7.25,
    "Strawberry Coconut": 6.75,
    "Oreo Ice Blended": 6.95,
    "Taro Ice Blended": 6.95,
    "Mango Matcha Fresh Milk": 6.75,
    "Strawberry Matcha Fresh Milk": 6.75
}

# Generating SQL file
with open("insert_data.sql", "w") as f:
    
    # creating the tables in SQL
    f.write("""
    -- Create tables
    CREATE TABLE IF NOT EXISTS ingredients (
        name VARCHAR(50) PRIMARY KEY,
        quantity INT
    );

    CREATE TABLE IF NOT EXISTS supplies (
        name VARCHAR(50) PRIMARY KEY,
        quantity INT
    );

    CREATE TABLE IF NOT EXISTS menu_items (
        name VARCHAR(50) PRIMARY KEY,
        price NUMERIC(5,2)
    );

    CREATE TABLE IF NOT EXISTS menu_item_ingredients (
        menu_item_name VARCHAR(50),
        ingredient_name VARCHAR(50),
        FOREIGN KEY (menu_item_name) REFERENCES menu_items(name),
        FOREIGN KEY (ingredient_name) REFERENCES ingredients(name)
    );

    """)
    
    # Ingredients table
    for ingredient, quantity in ingredients.items():
        f.write(f"INSERT INTO ingredients (name, quantity) VALUES ('{ingredient}', {quantity});\n")
    
    f.write("\n")
    
    # Supplies table
    for supply, quantity in supplies.items():
        f.write(f"INSERT INTO supplies (name, quantity) VALUES ('{supply}', {quantity});\n")
    
    f.write("\n")
    
    # Menu items table with the item name and its ingredients 
    for drink, ingredient_list in menu_items.items():
        price = menu_prices[drink]
        f.write(f"INSERT INTO menu_items (name, price) VALUES ('{drink}', {price});\n")
        
        for ingredient in ingredient_list:
            f.write(f"INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('{drink}', '{ingredient}');\n")

print("SQL file 'insert_data.sql' generated successfully with fixed quantities!")



