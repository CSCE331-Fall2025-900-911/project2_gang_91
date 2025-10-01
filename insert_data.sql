
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

INSERT INTO ingredients (name, quantity) VALUES ('black_tea', 40);
INSERT INTO ingredients (name, quantity) VALUES ('green_tea', 444);
INSERT INTO ingredients (name, quantity) VALUES ('thai_tea', 284);
INSERT INTO ingredients (name, quantity) VALUES ('coffee', 40);
INSERT INTO ingredients (name, quantity) VALUES ('milk', 152);
INSERT INTO ingredients (name, quantity) VALUES ('tapioca_pearl', 324);
INSERT INTO ingredients (name, quantity) VALUES ('pudding', 260);
INSERT INTO ingredients (name, quantity) VALUES ('honey_jelly', 355);
INSERT INTO ingredients (name, quantity) VALUES ('coconut_milk', 392);
INSERT INTO ingredients (name, quantity) VALUES ('strawberry_syrup', 35);
INSERT INTO ingredients (name, quantity) VALUES ('mango_syrup', 232);
INSERT INTO ingredients (name, quantity) VALUES ('matcha_powder', 34);
INSERT INTO ingredients (name, quantity) VALUES ('oreo_crush', 322);
INSERT INTO ingredients (name, quantity) VALUES ('brown_sugar_syrup', 393);
INSERT INTO ingredients (name, quantity) VALUES ('honey', 485);
INSERT INTO ingredients (name, quantity) VALUES ('lemonade', 493);
INSERT INTO ingredients (name, quantity) VALUES ('taro_syrup', 320);
INSERT INTO ingredients (name, quantity) VALUES ('red_bean', 488);
INSERT INTO ingredients (name, quantity) VALUES ('cream', 130);
INSERT INTO ingredients (name, quantity) VALUES ('ice', 59);
INSERT INTO ingredients (name, quantity) VALUES ('blender', 10);
INSERT INTO ingredients (name, quantity) VALUES ('peach_syrup', 50);

INSERT INTO supplies (name, quantity) VALUES ('cups', 144);
INSERT INTO supplies (name, quantity) VALUES ('lids', 96);
INSERT INTO supplies (name, quantity) VALUES ('wide_straws', 171);
INSERT INTO supplies (name, quantity) VALUES ('napkins', 149);
INSERT INTO supplies (name, quantity) VALUES ('to_go_bags', 67);

INSERT INTO menu_items (name, price) VALUES ('Classic Pearl Milk Tea', 5.8);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Classic Pearl Milk Tea', 'black_tea');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Classic Pearl Milk Tea', 'milk');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Classic Pearl Milk Tea', 'tapioca_pearl');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Classic Pearl Milk Tea', 'ice');
INSERT INTO menu_items (name, price) VALUES ('Mango Green Milk Tea', 6.5);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Mango Green Milk Tea', 'green_tea');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Mango Green Milk Tea', 'milk');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Mango Green Milk Tea', 'mango_syrup');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Mango Green Milk Tea', 'tapioca_pearl');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Mango Green Milk Tea', 'ice');
INSERT INTO menu_items (name, price) VALUES ('Coffee Crema', 6.5);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Coffee Crema', 'coffee');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Coffee Crema', 'milk');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Coffee Crema', 'cream');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Coffee Crema', 'ice');
INSERT INTO menu_items (name, price) VALUES ('Thai Pearl Milk Tea', 6.25);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Thai Pearl Milk Tea', 'thai_tea');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Thai Pearl Milk Tea', 'milk');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Thai Pearl Milk Tea', 'tapioca_pearl');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Thai Pearl Milk Tea', 'ice');
INSERT INTO menu_items (name, price) VALUES ('Classic Tea', 4.65);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Classic Tea', 'black_tea');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Classic Tea', 'ice');
INSERT INTO menu_items (name, price) VALUES ('Honey Tea', 4.85);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Honey Tea', 'black_tea');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Honey Tea', 'honey');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Honey Tea', 'ice');
INSERT INTO menu_items (name, price) VALUES ('Peach Tea with Honey Jelly', 6.25);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Peach Tea with Honey Jelly', 'black_tea');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Peach Tea with Honey Jelly', 'peach_syrup');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Peach Tea with Honey Jelly', 'honey_jelly');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Peach Tea with Honey Jelly', 'ice');
INSERT INTO menu_items (name, price) VALUES ('Honey Lemonade', 5.2);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Honey Lemonade', 'lemonade');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Honey Lemonade', 'honey');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Honey Lemonade', 'ice');
INSERT INTO menu_items (name, price) VALUES ('Mango Green Tea', 5.8);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Mango Green Tea', 'green_tea');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Mango Green Tea', 'mango_syrup');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Mango Green Tea', 'ice');
INSERT INTO menu_items (name, price) VALUES ('Tiger Boba', 6.5);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Tiger Boba', 'black_tea');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Tiger Boba', 'milk');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Tiger Boba', 'brown_sugar_syrup');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Tiger Boba', 'tapioca_pearl');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Tiger Boba', 'ice');
INSERT INTO menu_items (name, price) VALUES ('Halo Halo', 6.95);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Halo Halo', 'milk');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Halo Halo', 'tapioca_pearl');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Halo Halo', 'red_bean');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Halo Halo', 'pudding');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Halo Halo', 'ice');
INSERT INTO menu_items (name, price) VALUES ('Strawberry Coconut Ice Blended', 6.5);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Strawberry Coconut Ice Blended', 'strawberry_syrup');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Strawberry Coconut Ice Blended', 'coconut_milk');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Strawberry Coconut Ice Blended', 'ice');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Strawberry Coconut Ice Blended', 'blender');
INSERT INTO menu_items (name, price) VALUES ('Mango Matcha Fresh Milk', 6.5);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Mango Matcha Fresh Milk', 'matcha_powder');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Mango Matcha Fresh Milk', 'milk');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Mango Matcha Fresh Milk', 'mango_syrup');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Mango Matcha Fresh Milk', 'ice');
INSERT INTO menu_items (name, price) VALUES ('Strawberry Matcha Fresh Milk', 6.5);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Strawberry Matcha Fresh Milk', 'matcha_powder');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Strawberry Matcha Fresh Milk', 'milk');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Strawberry Matcha Fresh Milk', 'strawberry_syrup');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Strawberry Matcha Fresh Milk', 'ice');
INSERT INTO menu_items (name, price) VALUES ('Oreo with Pearl Ice Blended', 6.75);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Oreo with Pearl Ice Blended', 'oreo_crush');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Oreo with Pearl Ice Blended', 'milk');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Oreo with Pearl Ice Blended', 'tapioca_pearl');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Oreo with Pearl Ice Blended', 'ice');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Oreo with Pearl Ice Blended', 'blender');
INSERT INTO menu_items (name, price) VALUES ('Taro Ice Blended with Pudding', 6.75);
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Taro Ice Blended with Pudding', 'taro_syrup');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Taro Ice Blended with Pudding', 'milk');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Taro Ice Blended with Pudding', 'pudding');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Taro Ice Blended with Pudding', 'ice');
INSERT INTO menu_item_ingredients (menu_item_name, ingredient_name) VALUES ('Taro Ice Blended with Pudding', 'blender');
