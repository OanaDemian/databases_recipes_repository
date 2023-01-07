CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name text,
  cooking_time int,
  rating int
);

INSERT INTO recipes (id, name, cooking_time, rating) VALUES ('1', 'Mozzarella and Basil Pizza', '45', '5');
INSERT INTO recipes (id, name, cooking_time, rating) VALUES ('2', 'Spicy Roasted Parsnip Soup', '35', '5');
INSERT INTO recipes (id, name, cooking_time, rating) VALUES ('3', 'WInter Pulse Broth', '55', '3');
