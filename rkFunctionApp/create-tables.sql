CREATE TABLE recipes (
  id INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (name)
);



CREATE TABLE ingredients (
  id INT NOT NULL, 
  name VARCHAR(30) NOT NULL,
  price INT NOT NULL,
  PRIMARY KEY (id),  
  UNIQUE (name)
);

CREATE TABLE recipe_ingredients (
  recipe_id int NOT NULL, 
  ingredient_id INT NOT NULL, 
  amount INT NOT NULL,
  unit VARCHAR(10),
  PRIMARY KEY (recipe_id,ingredient_id)
);

INSERT INTO recipe_ingredients 
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


INSERT INTO recipes 
    (id, name) 
VALUES 
    (1,'Tacos'),
    (2,'Tomato Soup'),
    (3,'Grilled Cheese');


INSERT INTO ingredients
    (id, name, price)
VALUES 
    (1, 'Beef', 5),
    (2, 'Lettuce', 1),
    (3, 'Tomatoes', 2),
    (4, 'Taco Shell', 2),
    (5, 'Cheese', 3),
    (6, 'Milk', 1),
    (7, 'Bread', 2);