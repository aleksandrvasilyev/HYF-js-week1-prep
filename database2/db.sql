DROP DATABASE IF EXISTS recipes; 
CREATE DATABASE recipes; 
USE recipes;

CREATE TABLE recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE ingredients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE steps (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE recipes_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT,
    category_id INT,
    FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);


CREATE TABLE recipes_ingredients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT,
    ingredient_id INT,
    FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);


CREATE TABLE recipes_steps (
    id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT,
    step_id INT,
    step_number INT NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    FOREIGN KEY (step_id) REFERENCES steps(id)
);


-- insert data

INSERT INTO recipes VALUES 
(1, 'No-Bake Cheesecake'),
(2, 'Roasted Brussels Sprouts'),
(3, 'Mac & Cheese'),
(4, 'Tamagoyaki Japanese Omelette');


INSERT INTO categories VALUES 
(1, 'Cake'),
(2, 'No-Bake'),
(3, 'Vegetarian'),
(4, 'Vegan'),
(5, 'Gluten-Free'),
(6, 'Japanese');

INSERT INTO ingredients VALUES 
(1, 'Condensed milk'),
(2, 'Cream Cheese'),
(3, 'Lemon Juice'),
(4, 'Pie Crust'),
(5, 'Cherry Jam'),
(6, 'Brussels Sprouts'),
(7, 'Sesame seeds'),
(8, 'Pepper'),
(9, 'Salt'),
(10, 'Olive oil'),
(11, 'Macaroni'),
(12, 'Butter'),
(13, 'Flour'),
(14, 'Milk'),
(15, 'Shredded Cheddar cheese'),
(16, 'Eggs'),
(17, 'Soy sauce'),
(18, 'Sugar');


INSERT INTO steps VALUES
(1, 'Beat Cream Cheese'),
(2, 'Add condensed Milk and blend'),
(3, 'Add Lemon Juice and blend'),
(4, 'Add the mix to the pie crust'),
(5, 'Spread the Cherry Jam'),
(6, 'Place in refrigerator for 3h.'),
(7, 'Preheat the oven'),
(8, 'Mix the ingredients in a bowl'),
(9, 'Spread the mix on baking sheet'),
(10, 'Bake for 30'''),
(11, 'Cook Macaroni for 8'''),
(12, 'Melt butter in a saucepan'),
(13, 'Add flour, salt, pepper and mix'),
(14, 'Add Milk and mix'),
(15, 'Cook until mix is smooth'),
(16, 'Add cheddar cheese'),
(17, 'Add the macaroni'),
(18, 'Beat the eggs'),
(19, 'Add soya sauce, sugar and salt'),
(20, 'Add oil to a sauce pan'),
(21, 'Bring to medium heat'),
(22, 'Add some mix to the sauce pan'),
(23, 'Let is cook for 1'''),
(24, 'Remove pan from fire');

INSERT INTO recipes_categories VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 3, 3),
(7, 4, 3),
(8, 4, 6);


INSERT INTO recipes_ingredients VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 2, 6),
(7, 2, 3),
(8, 2, 7),
(9, 2, 8),
(10, 2, 9),
(11, 2, 10),
(12, 3, 11),
(13, 3, 12),
(14, 3, 13),
(15, 3, 9),
(16, 3, 8),
(17, 3, 14),
(18, 3, 15),
(19, 4, 16),
(20, 4, 17),
(21, 4, 18),
(22, 4, 9),
(23, 4, 10);


INSERT INTO recipes_steps VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 1, 4, 4),
(5, 1, 5, 5),
(6, 1, 6, 6),
(7, 2, 7, 1),
(8, 2, 8, 2),
(9, 2, 9, 3),
(10, 2, 10, 4),
(11, 3, 11, 1),
(12, 3, 12, 2),
(13, 3, 13, 3),
(14, 3, 14, 4),
(15, 3, 15, 5),
(16, 3, 16, 6),
(17, 3, 17, 7),
(18, 4, 18, 1),
(19, 4, 19, 2),
(20, 4, 20, 3),
(21, 4, 21, 4),
(22, 4, 22, 5),
(23, 4, 23, 6),
(24, 4, 20, 7),
(25, 4, 22, 8),
(26, 4, 23, 9),
(27, 4, 24, 10);