
INSERT INTO [dbo].[recipes] 
    (id, name) 
VALUES 
    (1,'Hamburger'),
    (2,'Pizza'),
    (3,'Hotdog');


INSERT INTO [dbo].[ingredients]
    (id, name, price)
VALUES 
    (1, 'Beef', 5),
    (2, 'Lettuce', 1),
    (3, 'Tomatoes', 2),
    (4, 'Sausage', 2),
    (5, 'Cheese', 3),
    (6, 'Milk', 1),
    (7, 'Bread', 2);


INSERT INTO [recipe_ingredients]
    (recipe_id, ingredient_id, amount)
VALUES
    (1,1,1),
    (1,2,2),
    (1,3,2),
    (1,4,3),
    (1,5,1),
    (2,3,2),
    (2,6,1),
    (3,5,1),
    (3,7,2);

