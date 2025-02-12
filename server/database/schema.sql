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
  ("Ail", "gousse"),
  ("Oignons", "pièce"),
  ("Laitue", "g"),
  ("Poitrine de poulet", "g"),
  ("Croûtons", "g"),
  ("Mayonnaise", "cuillère à soupe"),
  ("Parmesan", "g"),
  ("Œufs", "unité"),
  ("Fromage", "g"),
  ("Sel", "pincée"),
  ("Poivre", "pincée"),
  ("Pâtes", "g"),
  ("Tomates", "pièce"),
  ("Mozzarella", "g"),
  ("Basilic", "brin"),
  ("Sel", "g"),
  ("Poivre", "g"),
  ("Saumon", "g"),
  ("Pommes de terre", "g"),
  ("Crème fraîche", "g"),
  ("Ciboulette", "brin"),
  ("Citron", "pièce"),
  ("Farine", "g"),
  ("Oeufs", "pièce"),
  ("Lait", "ml");

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
   "https://media.istockphoto.com/id/1227170236/fr/photo/bolognese-de-spaghetti-v%C3%A9g%C3%A9talien-sain.jpg?s=2048x2048&w=is&k=20&c=is20hrK2H8yGQ-erw2REd83S0aPomA7OEyGKPv28Qrg=", 10, 30),

  ("Spaghetti à la mozzarella", "dîner", "Des pâtes avec une sauce tomate maison et de la mozzarella fondue.", 
   '[{"step":1,"instruction":"Cuire les pâtes dans de l\'eau bouillante salée."},
     {"step":2,"instruction":"Couper les tomates et les faire revenir dans une poêle avec de l\'ail et de l\'huile d\'olive."},
     {"step":3,"instruction":"Ajouter la mozzarella et laisser fondre."}]',
   "https://cdn.pixabay.com/photo/2016/05/14/18/20/spaghetti-1392266_1280.jpg", 15, 20),
  
  ("Saumon au four", "dîner", "Un saumon cuit au four accompagné de pommes de terre et de ciboulette.", 
   '[{"step":1,"instruction":"Préchauffer le four à 180°C."},
     {"step":2,"instruction":"Assaisonner le saumon avec du sel, du poivre, et un peu de citron."},
     {"step":3,"instruction":"Cuire le saumon au four pendant 20 minutes."}]',
   "https://cdn.pixabay.com/photo/2015/04/08/13/14/food-712666_1280.jpg", 10, 25),
  
  ("Omelette aux fines herbes", "petit-déjeuner", "Une omelette rapide avec des fines herbes et des oignons.", 
   '[{"step":1,"instruction":"Battre les œufs avec du sel et du poivre."},
     {"step":2,"instruction":"Faire cuire l\'omelette dans une poêle avec des oignons et de la ciboulette."}]',
   "https://cdn.pixabay.com/photo/2015/11/30/20/03/omelette-1071021_960_720.jpg", 5, 10),

  ("Gratin dauphinois", "dîner", "Un gratin crémeux à base de pommes de terre et de crème fraîche.", 
   '[{"step":1,"instruction":"Éplucher les pommes de terre et les couper en fines tranches."},
     {"step":2,"instruction":"Les faire cuire avec de la crème, du sel et du poivre."},
     {"step":3,"instruction":"Faire gratiner au four pendant 30 minutes."}]',
   "https://cdn.pixabay.com/photo/2018/08/05/21/42/potato-casserole-3586488_1280.jpg", 15, 50),

   ("Omelette au Fromage", "breakfast", 
   "Une omelette simple et rapide avec du fromage fondant à l\'intérieur, parfaite pour le petit déjeuner.", 
   '[{"step": 1, "instruction": "Battre les œufs dans un bol avec du sel et du poivre."}, 
     {"step": 2, "instruction": "Faire chauffer une poêle et y verser les œufs battus."}, 
     {"step": 3, "instruction": "Ajouter le fromage râpé au centre de l\'omelette et laisser fondre."}, 
     {"step": 4, "instruction": "Plier l\'omelette et la servir immédiatement."}]', 
   "https://cdn.pixabay.com/photo/2015/05/20/16/11/kitchen-775746_1280.jpg", 5, 10),

   ("Salade César", "lunch", 
   "Une salade légère à base de laitue, poulet grillé, croûtons et sauce César maison.", 
   '[{"step": 1, "instruction": "Faire cuire le poulet dans une poêle avec de l\'huile d\'olive."}, 
     {"step": 2, "instruction": "Couper la laitue et la mélanger avec les croûtons."}, 
     {"step": 3, "instruction": "Préparer la sauce en mélangeant de la mayonnaise, du yaourt nature, de l\'ail et du parmesan."}, 
     {"step": 4, "instruction": "Ajouter le poulet grillé à la salade, verser la sauce et servir."}]', 
   "https://media.istockphoto.com/id/1343569460/fr/photo/un-bol-blanc-de-salade-caesar-photographie.jpg?s=2048x2048&w=is&k=20&c=LYHd6gdhA1vwUAEpWSl8tisN6lziYOaaZDVSW_fnIC0=", 10, 15),

  ("Tarte aux pommes", "dessert", "Une tarte sucrée avec des pommes, idéale pour le goûter.", 
   '[{"step":1,"instruction":"Préparer la pâte en mélangeant la farine, l\'œuf, et le beurre."},
     {"step":2,"instruction":"Couper les pommes en fines tranches et les disposer sur la pâte."},
     {"step":3,"instruction":"Cuire au four pendant 25 minutes à 180°C."}]',
   "https://cdn.pixabay.com/photo/2015/12/01/08/13/apple-pie-1071747_960_720.jpg", 20, 40);

   -- --------------------------------------------------------------
   -- recipe_ingredient --------------------------------------------

   -- Spaghetti bolognaise
   insert into recipe_ingredient(recipe_id, ingredient_id, quantity)
values
  (1, 1, "200"),
  (1, 2, "500"),
  (1, 3, "400"),
  (1, 5, "1"),
  (1, 4, "2");

  -- Spaghetti à la mozzarella
insert into recipe_ingredient (recipe_id, ingredient_id, quantity) values
  (2, 1, "200"),
  (2, 2, "3"),
  (2, 3, "100"),
  (2, 4, "2"),
  (2, 5, "5"),
  (2, 6, "3");

-- Saumon au four
insert into recipe_ingredient (recipe_id, ingredient_id, quantity) values
  (3, 7, "300"),
  (3, 8, "2"),
  (3, 12, "1"),
  (3, 5, "3"),
  (3, 6, "2");

-- Omelette aux fines herbes
insert into recipe_ingredient (recipe_id, ingredient_id, quantity) values
  (4, 13, "2"),
  (4, 9, "1"),
  (4, 10, "1"),
  (4, 6, "2");

-- Gratin dauphinois
insert into recipe_ingredient (recipe_id, ingredient_id, quantity) values
  (5, 8, "5"),
  (5, 12, "200"),
  (5, 5, "3"),
  (5, 6, "2");

-- Omelette au fromage
   insert into recipe_ingredient(recipe_id, ingredient_id, quantity)
values
  (6, 11, "3"),
  (6, 12, "50"),
  (6, 13, "1"),
  (6, 14, "1");

-- Salade caesar
     insert into recipe_ingredient(recipe_id, ingredient_id, quantity)
values
  (7, 6, "100"),
  (7, 7, "200"),
  (7, 8, "50"),
  (7, 9, "2"),
  (7, 10, "30");

-- Tarte aux pommes
insert into recipe_ingredient (recipe_id, ingredient_id, quantity) values
  (8, 8, "3"),
  (8, 14, "200"),
  (8, 15, "1"),
  (8, 5, "10");