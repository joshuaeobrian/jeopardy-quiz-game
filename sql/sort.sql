CREATE TABLE category(
  id SERIAL PRIMARY KEY NOT NULL,
  category_type VARCHAR(30) NOT NULL
);
CREATE UNIQUE INDEX category_id_unique on category(id);
CREATE UNIQUE INDEX category_category_type_unique on category(category_type);

INSERT into category(category_type)VALUES (
  'Java'
);
INSERT into category(category_type)VALUES (
  'Html'
);
INSERT into category(category_type)VALUES (
  'Css'
);
INSERT into category(category_type)VALUES (
  'Python'
);
INSERT into category(category_type)VALUES (
  'Spring'
);
INSERT into category(category_type)VALUES (
  'Thymeleaf'
);
INSERT into category(category_type)VALUES (
  'JavaScript'
);

Create Table questions(
  id SERIAL PRIMARY KEY NOT NULL,
  question VARCHAR(100) NOT NULL ,
  category_id INTEGER REFERENCES category(id)

);
CREATE UNIQUE INDEX questions_id_unique on questions(id);
CREATE UNIQUE INDEX questions_question_unique on category(category_type);

INSERT INTO questions(question, category_id) VALUES (
  'This is how you would make things show in the console. ',
  1
);
INSERT INTO questions(question, category_id) VALUES (
  'This is how you would iterate through something.',
  1
);
INSERT INTO questions(question, category_id) VALUES (
  'Connecting a Class to another Class without making a new instance.',
  1
);

INSERT INTO questions(question, category_id) VALUES (
  'You need this to start a java application.',
  1
);

INSERT INTO questions(question, category_id) VALUES (
  'The environment need to run an application.',
  1
);

INSERT INTO questions(question, category_id) VALUES (
  'The company that maintains Java is known as who.',
  1
);

CREATE TABLE item_value(
  id SERIAL PRIMARY KEY NOT NULL ,
  value_amount INTEGER NOT NULL
);
CREATE UNIQUE INDEX item_value_id_unique on item_value(id);
CREATE UNIQUE INDEX item_value_value_amount_unique on item_value(value_amount);


INSERT INTO item_value(value_amount)VALUES (
  100
);
INSERT INTO item_value(value_amount)VALUES (
  100
);