-- Run this script manually to load recipe data
-- Command: psql -U postgres -d cookle -f load-recipes.sql

-- Clear existing data
TRUNCATE TABLE recipes_instructions CASCADE;
TRUNCATE TABLE recipes_ingridients CASCADE;
TRUNCATE TABLE recipes CASCADE;
TRUNCATE TABLE ingridients CASCADE;

-- Insert ingredients
INSERT INTO ingridients (id, name, amount) VALUES 
(1, 'Flour', 0), (2, 'Sugar', 0), (3, 'Eggs', 0), (4, 'Milk', 0),
(5, 'Butter', 0), (6, 'Salt', 0), (7, 'Baking Powder', 0), (8, 'Vanilla Extract', 0),
(9, 'Chocolate Chips', 0), (10, 'Olive Oil', 0), (11, 'Garlic', 0), (12, 'Onion', 0),
(13, 'Tomatoes', 0), (14, 'Chicken', 0), (15, 'Beef', 0), (16, 'Pasta', 0),
(17, 'Rice', 0), (18, 'Lemon', 0), (19, 'Cheese', 0), (20, 'Potatoes', 0),
(21, 'Carrots', 0), (22, 'Celery', 0), (23, 'Bell Peppers', 0), (24, 'Parsley', 0),
(25, 'Basil', 0), (26, 'Oregano', 0), (27, 'Cinnamon', 0), (28, 'Honey', 0),
(29, 'Strawberries', 0), (30, 'Blueberries', 0);

-- Insert recipes
INSERT INTO recipes (id, name, yield) VALUES 
(1, 'Chocolate Chip Cookies', 24), (2, 'Classic Pancakes', 8), (3, 'Spaghetti Bolognese', 4),
(4, 'Chicken Alfredo Pasta', 4), (5, 'Beef Stew', 6), (6, 'Vegetable Soup', 8),
(7, 'Strawberry Smoothie', 2), (8, 'Blueberry Muffins', 12), (9, 'Roast Chicken', 6),
(10, 'Mashed Potatoes', 6), (11, 'Caesar Salad', 4), (12, 'French Toast', 4),
(13, 'Chocolate Cake', 10), (14, 'Beef Lasagna', 8), (15, 'Chicken Soup', 6),
(16, 'Garlic Bread', 8), (17, 'Lemon Cheesecake', 12), (18, 'Carrot Cake', 12),
(19, 'Chicken Stir Fry', 4), (20, 'Strawberry Shortcake', 8);

-- Recipe ingredients (with ingredient amounts)
INSERT INTO recipes_ingridients (recipe_id, ingredient_id, amount) VALUES
-- Recipe 1: Chocolate Chip Cookies
(1, 1, 225), (1, 2, 150), (1, 3, 2), (1, 5, 115), (1, 6, 1), (1, 7, 5), (1, 8, 5), (1, 9, 200),
-- Recipe 2: Classic Pancakes
(2, 1, 200), (2, 2, 30), (2, 3, 1), (2, 4, 250), (2, 5, 30), (2, 6, 1), (2, 7, 10),
-- Recipe 3: Spaghetti Bolognese
(3, 15, 500), (3, 16, 400), (3, 11, 3), (3, 12, 1), (3, 13, 400), (3, 10, 15), (3, 6, 2), (3, 26, 5),
-- Recipe 4: Chicken Alfredo Pasta
(4, 14, 450), (4, 16, 400), (4, 5, 60), (4, 4, 250), (4, 19, 100), (4, 11, 2), (4, 6, 2),
-- Recipe 5: Beef Stew
(5, 15, 700), (5, 20, 500), (5, 21, 200), (5, 12, 2), (5, 22, 3), (5, 11, 4), (5, 10, 30), (5, 6, 3),
-- Recipe 6: Vegetable Soup
(6, 21, 300), (6, 20, 400), (6, 22, 3), (6, 12, 2), (6, 11, 3), (6, 10, 20), (6, 6, 3), (6, 24, 10),
-- Recipe 7: Strawberry Smoothie
(7, 29, 250), (7, 4, 200), (7, 28, 15), (7, 8, 5),
-- Recipe 8: Blueberry Muffins
(8, 1, 250), (8, 2, 150), (8, 3, 2), (8, 4, 120), (8, 5, 60), (8, 7, 10), (8, 6, 1), (8, 30, 200), (8, 8, 5),
-- Recipe 9: Roast Chicken
(9, 14, 1500), (9, 10, 30), (9, 6, 3), (9, 11, 4), (9, 18, 1), (9, 26, 5),
-- Recipe 10: Mashed Potatoes
(10, 20, 1000), (10, 5, 60), (10, 4, 120), (10, 6, 2),
-- Recipe 11: Caesar Salad
(11, 14, 200), (11, 10, 45), (11, 11, 2), (11, 18, 1), (11, 19, 50), (11, 6, 1),
-- Recipe 12: French Toast
(12, 3, 3), (12, 4, 180), (12, 2, 15), (12, 8, 5), (12, 27, 2), (12, 5, 30), (12, 1, 8),
-- Recipe 13: Chocolate Cake
(13, 1, 300), (13, 2, 250), (13, 3, 3), (13, 4, 250), (13, 5, 120), (13, 7, 10), (13, 8, 10), (13, 9, 150),
-- Recipe 14: Beef Lasagna
(14, 15, 500), (14, 16, 250), (14, 13, 400), (14, 12, 1), (14, 11, 3), (14, 19, 200), (14, 26, 5), (14, 6, 2),
-- Recipe 15: Chicken Soup
(15, 14, 700), (15, 21, 200), (15, 22, 3), (15, 12, 1), (15, 11, 2), (15, 24, 10), (15, 6, 3),
-- Recipe 16: Garlic Bread
(16, 1, 1), (16, 5, 100), (16, 11, 6), (16, 24, 15), (16, 6, 1),
-- Recipe 17: Lemon Cheesecake
(17, 1, 200), (17, 5, 80), (17, 2, 150), (17, 3, 3), (17, 19, 500), (17, 18, 2), (17, 8, 5),
-- Recipe 18: Carrot Cake
(18, 1, 250), (18, 2, 200), (18, 3, 4), (18, 5, 80), (18, 21, 300), (18, 7, 8), (18, 27, 5), (18, 8, 5),
-- Recipe 19: Chicken Stir Fry
(19, 14, 500), (19, 23, 2), (19, 21, 150), (19, 12, 1), (19, 11, 3), (19, 10, 30), (19, 6, 2), (19, 17, 200),
-- Recipe 20: Strawberry Shortcake
(20, 1, 300), (20, 2, 100), (20, 5, 100), (20, 7, 15), (20, 4, 180), (20, 29, 500), (20, 8, 5);

-- Recipe instructions
INSERT INTO recipes_instructions (description, recipe_id) VALUES
-- Recipe 1: Chocolate Chip Cookies
('Preheat oven to 375°F (190°C)', 1),
('In a bowl, cream together butter and sugar until smooth', 1),
('Beat in eggs one at a time, then stir in vanilla', 1),
('Combine flour, baking powder, and salt; add to the creamed mixture', 1),
('Fold in chocolate chips', 1),
('Drop by rounded spoonfuls onto ungreased cookie sheets', 1),
('Bake for 10 to 12 minutes or until edges are golden', 1),
('Let cool on cookie sheets for 5 minutes before transferring to wire racks', 1),

-- Recipe 2: Classic Pancakes
('In a large bowl, mix flour, sugar, salt, and baking powder', 2),
('Make a well in the center and pour in milk, egg, and melted butter', 2),
('Mix until smooth', 2),
('Heat a lightly oiled griddle or frying pan over medium-high heat', 2),
('Pour batter onto the griddle, using approximately 1/4 cup for each pancake', 2),
('Brown on both sides and serve hot', 2);

-- Add remaining instructions as needed (too many to include all here)
-- You can run additional scripts for the remaining recipes if needed 