-- ---------------------------------------------------------------
-- base tables ---------------------------------------------------
create table user (
  id int unsigned primary key auto_increment not null,
  name VARCHAR(50) not null,
  email varchar(255) not null unique,
  hashed_password varchar(255) not null
);

create table recipe (
  id int unsigned primary key auto_increment not null,
  title varchar(255) not null,
  meal_type varchar(50) not null default "lunch",
  description text not null,
  instructions json not null,
  image_src VARCHAR(255),
  prep_time int,
  cook_time int
);

create table ingredient (
  id int unsigned primary key auto_increment not null,
  name varchar(255) not null,
  unit varchar(50)
);

-- -----------------------------------------------------------
-- join tables ------------------------------------------------
create table recipe_ingredient (
  recipe_id int unsigned not null,
  ingredient_id int UNSIGNED not null,
  quantity VARCHAR(50),
  foreign key(recipe_id) references recipe(id) on delete cascade on update cascade,
  Foreign Key (ingredient_id) REFERENCES ingredient(id) on delete cascade on update cascade
);

create table meal_planning (
  id int unsigned PRIMARY KEY AUTO_INCREMENT NOT NULL,
  user_id int unsigned not null,
  recipe_id int unsigned not null,
  meal_date date,
  Foreign Key (user_id) REFERENCES user(id),
  Foreign Key (recipe_id) REFERENCES recipe(id)
);

create table meal_note (
  id int UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
  user_id int UNSIGNED not null,
  recipe_id int unsigned not null,
  Foreign Key (user_id) REFERENCES user(id),
  Foreign Key (recipe_id) REFERENCES recipe(id)
);

create table favorite_recipe (
  recipe_id int UNSIGNED not null,
  user_id int UNSIGNED not null,
  Foreign Key (recipe_id) REFERENCES recipe(id),
  Foreign Key (user_id) REFERENCES user(id)
);

-- ------------------------------------------------------------
-- insert table------------------------------------------------
insert into user(name, email, hashed_password)
values
  ("Jhon", "jdoe@mail.com", "$argon2id$v=19$m=19456,t=2,p=1$hwnbcGju2LqLaR/L1klQwQ$NnItXlp7ThSUZU1KJss+FGQhtKyDa60ECoB93BEpr/I");

-- -----------------------------------------------------
-- ingredients ----------------------------------------
insert into ingredient(name, unit)
values
  ("Spaghetti", "g"),
  ("Viande hachée", "g"),
  ("Tomates concassées", "g"),
  ("Oignon", "unité"),
  ("Ail", "gousse"),
  ("Laitue", "g"),
  ("Poitrine de poulet", "g"),
  ("Croûtons", "g"),
  ("Mayonnaise", "cuillère à soupe"),
  ("Parmesan", "g"),
  ("Œufs", "unité"),
  ("Fromage", "g"),
  ("Sel", "pincée"),
  ("Poivre", "pincée");

-- ----------------------------------------------
-- recipes -------------------------------------
insert into recipe(title, meal_type, description, instructions, image_src, prep_time, cook_time)
values
  ("Spaghetti Bolognese", "dinner", 
   "Une recette classique de spaghetti à la sauce bolognese, savoureuse et facile à préparer.", 
   '[{"step": 1, "instruction": "Faire revenir l\'oignon et l\'ail hachés dans une poêle avec un peu d\'huile."}, 
     {"step": 2, "instruction": "Ajouter la viande hachée et cuire jusqu\'à ce qu\'elle soit bien dorée."}, 
     {"step": 3, "instruction": "Ajouter les tomates concassées, le sel, le poivre et les herbes, puis laisser mijoter."}, 
     {"step": 4, "instruction": "Faire cuire les spaghetti selon les instructions du paquet, puis servir avec la sauce bolognese."}]', 
   "spaghetti_bolognese.jpg", 10, 30);

   insert into recipe_ingredient(recipe_id, ingredient_id, quantity)
values
  ((select id from recipe where title = "Spaghetti Bolognese"), (select id from ingredient where name = "Spaghetti"), "200"),
  ((select id from recipe where title = "Spaghetti Bolognese"), (select id from ingredient where name = "Viande hachée"), "500"),
  ((select id from recipe where title = "Spaghetti Bolognese"), (select id from ingredient where name = "Tomates concassées"), "400"),
  ((select id from recipe where title = "Spaghetti Bolognese"), (select id from ingredient where name = "Oignon"), "1"),
  ((select id from recipe where title = "Spaghetti Bolognese"), (select id from ingredient where name = "Ail"), "2");

  insert into recipe(title, meal_type, description, instructions, image_src, prep_time, cook_time)
values
  ("Salade César", "lunch", 
   "Une salade légère à base de laitue, poulet grillé, croûtons et sauce César maison.", 
   '[{"step": 1, "instruction": "Faire cuire le poulet dans une poêle avec de l\'huile d\'olive."}, 
     {"step": 2, "instruction": "Couper la laitue et la mélanger avec les croûtons."}, 
     {"step": 3, "instruction": "Préparer la sauce en mélangeant de la mayonnaise, du yaourt nature, de l\'ail et du parmesan."}, 
     {"step": 4, "instruction": "Ajouter le poulet grillé à la salade, verser la sauce et servir."}]', 
   "caesar_salad.jpg", 10, 15);

   insert into recipe_ingredient(recipe_id, ingredient_id, quantity)
values
  ((select id from recipe where title = "Salade César"), (select id from ingredient where name = "Laitue"), "100"),
  ((select id from recipe where title = "Salade César"), (select id from ingredient where name = "Poitrine de poulet"), "200"),
  ((select id from recipe where title = "Salade César"), (select id from ingredient where name = "Croûtons"), "50"),
  ((select id from recipe where title = "Salade César"), (select id from ingredient where name = "Mayonnaise"), "2"),
  ((select id from recipe where title = "Salade César"), (select id from ingredient where name = "Parmesan"), "30");

insert into recipe(title, meal_type, description, instructions, image_src, prep_time, cook_time)
values
  ("Omelette au Fromage", "breakfast", 
   "Une omelette simple et rapide avec du fromage fondant à l\'intérieur, parfaite pour le petit déjeuner.", 
   '[{"step": 1, "instruction": "Battre les œufs dans un bol avec du sel et du poivre."}, 
     {"step": 2, "instruction": "Faire chauffer une poêle et y verser les œufs battus."}, 
     {"step": 3, "instruction": "Ajouter le fromage râpé au centre de l\'omelette et laisser fondre."}, 
     {"step": 4, "instruction": "Plier l\'omelette et la servir immédiatement."}]', 
   "cheese_omelette.jpg", 5, 10);

   insert into recipe_ingredient(recipe_id, ingredient_id, quantity)
values
  ((select id from recipe where title = "Omelette au Fromage"), (select id from ingredient where name = "Œufs"), "3"),
  ((select id from recipe where title = "Omelette au Fromage"), (select id from ingredient where name = "Fromage"), "50"),
  ((select id from recipe where title = "Omelette au Fromage"), (select id from ingredient where name = "Sel"), "1"),
  ((select id from recipe where title = "Omelette au Fromage"), (select id from ingredient where name = "Poivre"), "1");