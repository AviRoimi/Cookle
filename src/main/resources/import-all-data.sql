-- Clear existing data
TRUNCATE TABLE public."RECIPES_INSTRUCTIONS" CASCADE;
TRUNCATE TABLE public."RECIPES_INGRIDIENTS" CASCADE;
TRUNCATE TABLE public."RECIPES" CASCADE;
TRUNCATE TABLE public."INGRIDIENTS" CASCADE;

-- Insert ingredients with valid amounts
INSERT INTO public."INGRIDIENTS" ("ID", "NAME", "AMOUNT") VALUES 
-- Basic baking ingredients with different quantities
(1, 'Flour', 100), (2, 'Flour', 200), (3, 'Flour', 500),
(4, 'Sugar', 50), (5, 'Sugar', 100), (6, 'Sugar', 250),
(7, 'Eggs', 1), (8, 'Eggs', 6), (9, 'Eggs', 12),
(10, 'Milk', 100), (11, 'Milk', 250), (12, 'Milk', 1000),
(13, 'Butter', 50), (14, 'Butter', 100), (15, 'Butter', 250),
(16, 'Salt', 5), (17, 'Salt', 10), (18, 'Salt', 25),
(19, 'Baking Powder', 5), (20, 'Baking Powder', 10), (21, 'Baking Powder', 20),
(22, 'Vanilla Extract', 5), (23, 'Vanilla Extract', 10), (24, 'Vanilla Extract', 20),
-- Other ingredients
(25, 'Chocolate Chips', 100), (26, 'Chocolate Chips', 200), (27, 'Chocolate Chips', 300),
(28, 'Olive Oil', 50), (29, 'Olive Oil', 100), (30, 'Olive Oil', 250),
(31, 'Garlic', 1), (32, 'Garlic', 3), (33, 'Garlic', 5),
(34, 'Onion', 1), (35, 'Onion', 2), (36, 'Onion', 3),
(37, 'Tomatoes', 200), (38, 'Tomatoes', 400), (39, 'Tomatoes', 800),
(40, 'Chicken', 250), (41, 'Chicken', 500), (42, 'Chicken', 1000),
(43, 'Beef', 250), (44, 'Beef', 500), (45, 'Beef', 1000),
(46, 'Pasta', 250), (47, 'Pasta', 500), (48, 'Pasta', 1000),
(49, 'Rice', 100), (50, 'Rice', 250), (51, 'Rice', 500),
(52, 'Lemon', 1), (53, 'Lemon', 2), (54, 'Lemon', 4),
(55, 'Cheese', 100), (56, 'Cheese', 200), (57, 'Cheese', 500),
(58, 'Potatoes', 250), (59, 'Potatoes', 500), (60, 'Potatoes', 1000),
(61, 'Carrots', 100), (62, 'Carrots', 200), (63, 'Carrots', 500),
(64, 'Celery', 1), (65, 'Celery', 3), (66, 'Celery', 5),
(67, 'Bell Peppers', 1), (68, 'Bell Peppers', 2), (69, 'Bell Peppers', 3),
(70, 'Parsley', 5), (71, 'Parsley', 10), (72, 'Parsley', 20),
(73, 'Basil', 5), (74, 'Basil', 10), (75, 'Basil', 20),
(76, 'Oregano', 5), (77, 'Oregano', 10), (78, 'Oregano', 15),
(79, 'Cinnamon', 5), (80, 'Cinnamon', 10), (81, 'Cinnamon', 20),
(82, 'Honey', 50), (83, 'Honey', 100), (84, 'Honey', 250),
(85, 'Strawberries', 100), (86, 'Strawberries', 250), (87, 'Strawberries', 500),
(88, 'Blueberries', 100), (89, 'Blueberries', 200), (90, 'Blueberries', 300);

-- Insert recipes
INSERT INTO public."RECIPES" ("ID", "NAME", "YIELD") VALUES 
(1, 'Chocolate Chip Cookies', 24), (2, 'Classic Pancakes', 8), (3, 'Spaghetti Bolognese', 4),
(4, 'Chicken Alfredo Pasta', 4), (5, 'Beef Stew', 6), (6, 'Vegetable Soup', 8),
(7, 'Strawberry Smoothie', 2), (8, 'Blueberry Muffins', 12), (9, 'Roast Chicken', 6),
(10, 'Mashed Potatoes', 6), (11, 'Caesar Salad', 4), (12, 'French Toast', 4),
(13, 'Chocolate Cake', 10), (14, 'Beef Lasagna', 8), (15, 'Chicken Soup', 6),
(16, 'Garlic Bread', 8), (17, 'Lemon Cheesecake', 12), (18, 'Carrot Cake', 12),
(19, 'Chicken Stir Fry', 4), (20, 'Strawberry Shortcake', 8);

-- Recipe ingredients (with ingredient amounts)
-- Recipe 1: Chocolate Chip Cookies
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(1, 3), (1, 6), (1, 8), (1, 14), (1, 17), (1, 20), (1, 23), (1, 26);

-- Recipe 2: Classic Pancakes
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(2, 2), (2, 5), (2, 7), (2, 11), (2, 14), (2, 17), (2, 20);

-- Recipe 3: Spaghetti Bolognese
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(3, 44), (3, 47), (3, 32), (3, 35), (3, 38), (3, 29), (3, 17), (3, 77);

-- Recipe 4: Chicken Alfredo Pasta
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(4, 41), (4, 47), (4, 14), (4, 11), (4, 56), (4, 32), (4, 17);

-- Recipe 5: Beef Stew
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(5, 45), (5, 59), (5, 62), (5, 35), (5, 65), (5, 32), (5, 29), (5, 17);

-- Recipe 6: Vegetable Soup
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(6, 62), (6, 59), (6, 65), (6, 35), (6, 32), (6, 29), (6, 17), (6, 71);

-- Recipe 7: Strawberry Smoothie
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(7, 86), (7, 11), (7, 83), (7, 23);

-- Recipe 8: Blueberry Muffins
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(8, 2), (8, 5), (8, 7), (8, 11), (8, 14), (8, 20), (8, 17), (8, 89), (8, 23);

-- Recipe 9: Roast Chicken
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(9, 42), (9, 29), (9, 17), (9, 32), (9, 52), (9, 77);

-- Recipe 10: Mashed Potatoes
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(10, 60), (10, 14), (10, 11), (10, 17);

-- Recipe 11: Caesar Salad
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(11, 40), (11, 29), (11, 32), (11, 52), (11, 56), (11, 17);

-- Recipe 12: French Toast
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(12, 8), (12, 11), (12, 5), (12, 23), (12, 80), (12, 14), (12, 1);

-- Recipe 13: Chocolate Cake
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(13, 3), (13, 6), (13, 8), (13, 11), (13, 14), (13, 20), (13, 23), (13, 26);

-- Recipe 14: Beef Lasagna
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(14, 44), (14, 47), (14, 38), (14, 35), (14, 32), (14, 56), (14, 77), (14, 17);

-- Recipe 15: Chicken Soup
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(15, 41), (15, 62), (15, 65), (15, 35), (15, 32), (15, 71), (15, 17);

-- Recipe 16: Garlic Bread
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(16, 1), (16, 14), (16, 33), (16, 71), (16, 17);

-- Recipe 17: Lemon Cheesecake
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(17, 2), (17, 14), (17, 5), (17, 8), (17, 57), (17, 53), (17, 23);

-- Recipe 18: Carrot Cake
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(18, 2), (18, 5), (18, 8), (18, 14), (18, 62), (18, 20), (18, 80), (18, 23);

-- Recipe 19: Chicken Stir Fry
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(19, 41), (19, 68), (19, 62), (19, 35), (19, 32), (19, 29), (19, 17), (19, 50);

-- Recipe 20: Strawberry Shortcake
INSERT INTO public."RECIPES_INGRIDIENTS" ("RECIPE_ID", "INGREDIENT_ID") VALUES
(20, 3), (20, 5), (20, 14), (20, 20), (20, 11), (20, 86), (20, 23);

-- Recipe 1: Chocolate Chip Cookies
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Preheat oven to 375°F (190°C)', 1),
('In a bowl, cream together butter and sugar until smooth', 1),
('Beat in eggs one at a time, then stir in vanilla', 1),
('Combine flour, baking powder, and salt; add to the creamed mixture', 1),
('Fold in chocolate chips', 1),
('Drop by rounded spoonfuls onto ungreased cookie sheets', 1),
('Bake for 10 to 12 minutes or until edges are golden', 1),
('Let cool on cookie sheets for 5 minutes before transferring to wire racks', 1);

-- Recipe 2: Classic Pancakes
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('In a large bowl, mix flour, sugar, salt, and baking powder', 2),
('Make a well in the center and pour in milk, egg, and melted butter', 2),
('Mix until smooth', 2),
('Heat a lightly oiled griddle or frying pan over medium-high heat', 2),
('Pour batter onto the griddle, using approximately 1/4 cup for each pancake', 2),
('Brown on both sides and serve hot', 2);

-- Recipe 3: Spaghetti Bolognese
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Heat oil in a large pot over medium heat', 3),
('Add onion and garlic, sauté until soft', 3),
('Add beef and cook until browned', 3),
('Add tomatoes, salt, and oregano', 3),
('Simmer for 30 minutes', 3),
('Cook pasta according to package instructions', 3),
('Serve sauce over pasta', 3);

-- Recipe 4: Chicken Alfredo Pasta
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Cook pasta according to package instructions', 4),
('Season chicken with salt and pepper; cook until no longer pink', 4),
('In a saucepan, melt butter over medium heat and add garlic', 4),
('Whisk in milk and bring to a simmer', 4),
('Add cheese and stir until melted and smooth', 4),
('Combine pasta, chicken, and sauce', 4);

-- Recipe 5: Beef Stew
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Heat oil in a large pot over medium-high heat', 5),
('Add beef and brown on all sides', 5),
('Add onion, garlic, and celery; cook until softened', 5),
('Add potatoes and carrots', 5),
('Add water to cover and bring to a boil', 5),
('Reduce heat and simmer for 2 hours or until meat is tender', 5),
('Season with salt to taste', 5);

-- Recipe 6: Vegetable Soup
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Heat oil in a large pot over medium heat', 6),
('Add onion, garlic, and celery; cook until softened', 6),
('Add potatoes and carrots', 6),
('Add water to cover and bring to a boil', 6),
('Reduce heat and simmer for 40 minutes', 6),
('Season with salt and garnish with parsley', 6);

-- Recipe 7: Strawberry Smoothie
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Wash and hull strawberries', 7),
('Place all ingredients in a blender', 7),
('Blend until smooth', 7),
('Pour into glasses and serve immediately', 7);

-- Recipe 8: Blueberry Muffins
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Preheat oven to 375°F (190°C)', 8),
('Line a muffin tin with paper liners', 8),
('In a bowl, cream together butter and sugar', 8),
('Beat in eggs, then stir in vanilla and milk', 8),
('Combine flour, baking powder, and salt; add to the wet ingredients', 8),
('Fold in blueberries', 8),
('Fill muffin cups 2/3 full', 8),
('Bake for 20-25 minutes or until golden brown', 8);

-- Recipe 9: Roast Chicken
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Preheat oven to 425°F (220°C)', 9),
('Rub chicken with olive oil, salt, and oregano', 9),
('Stuff cavity with garlic and lemon', 9),
('Place chicken in a roasting pan', 9),
('Roast for 1 hour and 15 minutes or until juices run clear', 9),
('Let rest for 15 minutes before carving', 9);

-- Recipe 10: Mashed Potatoes
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Peel and cut potatoes into chunks', 10),
('Place in a pot with cold water and salt', 10),
('Bring to a boil and cook until tender, about 15 minutes', 10),
('Drain and return to pot', 10),
('Add butter and milk', 10),
('Mash until smooth and creamy', 10),
('Season with salt to taste', 10);

-- Recipe 11: Caesar Salad
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Grill chicken until cooked through, slice into strips', 11),
('In a bowl, whisk together olive oil, lemon juice, and minced garlic', 11),
('Toss lettuce with dressing', 11),
('Top with grilled chicken and shaved cheese', 11),
('Season with salt to taste', 11);

-- Recipe 12: French Toast
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('In a shallow bowl, whisk together eggs, milk, sugar, vanilla, and cinnamon', 12),
('Dip bread slices in the egg mixture, coating both sides', 12),
('Heat butter in a skillet over medium heat', 12),
('Cook bread slices until golden brown on both sides', 12),
('Serve with maple syrup or honey', 12);

-- Recipe 13: Chocolate Cake
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Preheat oven to 350°F (175°C)', 13),
('Grease and flour a 9x13 inch baking pan', 13),
('In a large bowl, cream together butter and sugar until light and fluffy', 13),
('Beat in eggs one at a time, then stir in vanilla', 13),
('Combine flour and baking powder; add to the creamed mixture and mix well', 13),
('Stir in milk until batter is smooth', 13),
('Fold in chocolate chips', 13),
('Pour into prepared pan', 13),
('Bake for 30-35 minutes, or until a toothpick inserted comes out clean', 13);

-- Recipe 14: Beef Lasagna
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Preheat oven to 375°F (190°C)', 14),
('In a skillet, cook beef until browned; add onion and garlic', 14),
('Add tomatoes, oregano, and salt; simmer for 20 minutes', 14),
('In a baking dish, layer meat sauce, lasagna sheets, and cheese', 14),
('Repeat layers, ending with cheese on top', 14),
('Cover with foil and bake for 25 minutes', 14),
('Remove foil and bake for an additional 25 minutes', 14),
('Let stand for 15 minutes before serving', 14);

-- Recipe 15: Chicken Soup
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Place chicken in a large pot and cover with water', 15),
('Add onion, garlic, and salt; bring to a boil', 15),
('Reduce heat and simmer for 1 hour', 15),
('Remove chicken and set aside', 15),
('Add carrots and celery to the broth', 15),
('Simmer for 15 minutes or until vegetables are tender', 15),
('Shred chicken and return to pot', 15),
('Garnish with parsley before serving', 15);

-- Recipe 16: Garlic Bread
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Preheat oven to 350°F (175°C)', 16),
('In a bowl, mix softened butter with minced garlic, chopped parsley, and salt', 16),
('Cut bread loaf in half lengthwise', 16),
('Spread butter mixture on both halves', 16),
('Place on a baking sheet and bake for 15 minutes', 16),
('Slice and serve warm', 16);

-- Recipe 17: Lemon Cheesecake
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Preheat oven to 325°F (165°C)', 17),
('Crush biscuits and mix with melted butter', 17),
('Press mixture into the base of a springform pan', 17),
('In a large bowl, beat cream cheese and sugar until smooth', 17),
('Add eggs one at a time, beating after each addition', 17),
('Add lemon juice, lemon zest, and vanilla', 17),
('Pour mixture over the base', 17),
('Bake for 50-55 minutes or until center is almost set', 17),
('Cool and refrigerate for at least 4 hours', 17);

-- Recipe 18: Carrot Cake
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Preheat oven to 350°F (175°C)', 18),
('Grease and flour a 9x13 inch baking pan', 18),
('In a bowl, cream together butter and sugar', 18),
('Beat in eggs one at a time, then stir in vanilla', 18),
('In a separate bowl, mix flour, baking powder, and cinnamon', 18),
('Add dry ingredients to the creamed mixture', 18),
('Fold in grated carrots', 18),
('Pour into prepared pan', 18),
('Bake for 40-45 minutes', 18);

-- Recipe 19: Chicken Stir Fry
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Cook rice according to package instructions', 19),
('Cut chicken into bite-sized pieces', 19),
('Slice bell peppers, carrots, and onion', 19),
('Heat oil in a wok or large skillet over high heat', 19),
('Add chicken and cook until no longer pink', 19),
('Add vegetables and garlic; stir-fry for 5 minutes', 19),
('Season with salt', 19),
('Serve over rice', 19);

-- Recipe 20: Strawberry Shortcake
INSERT INTO public."RECIPES_INSTRUCTIONS" ("DESCRIPTION", "RECIPE_ID") VALUES
('Preheat oven to 425°F (220°C)', 20),
('In a bowl, combine flour, sugar, and baking powder', 20),
('Cut in butter until mixture resembles coarse crumbs', 20),
('Stir in milk just until moistened', 20),
('Drop by spoonfuls onto a greased baking sheet', 20),
('Bake for 15-18 minutes or until golden brown', 20),
('Slice strawberries and mix with sugar', 20),
('Split shortcakes in half; fill with strawberries', 20),
('Top with whipped cream and additional strawberries', 20); 