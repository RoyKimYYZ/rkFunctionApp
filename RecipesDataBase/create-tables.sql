CREATE TABLE recipes (
  id INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (name)
);

Go;


CREATE TABLE ingredients (
  id INT NOT NULL, 
  name VARCHAR(30) NOT NULL,
  price INT NOT NULL,
  PRIMARY KEY (id),  
  UNIQUE (name)
);

Go;

CREATE TABLE recipe_ingredients (
  recipe_id int NOT NULL, 
  ingredient_id INT NOT NULL, 
  amount INT NOT NULL,
  unit VARCHAR(10),
  PRIMARY KEY (recipe_id,ingredient_id)
);