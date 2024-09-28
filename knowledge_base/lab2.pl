% Ввод базы растений
plant(peashooter, attack).
plant(cabbage_pult, attack).
plant(wall_nut, defense).
plant(cherry_bomb, attack).
plant(sunflower, support).
plant(plant_food, support).

% Ввод базы зомби
zombie(backup_dancer).
zombie(balloon_zombie).
zombie(barrel_pirate).
zombie(baseball_zombie).
zombie(binary_stars).
zombie(black_hole).
zombie(blitzer).
zombie(boombox_zombie).
zombie(bug_zombie).
zombie(bungee_zombie).

% Связь растений с зомби
defeat(peashooter, balloon_zombie).
defeat(cabbage_pult, barrel_pirate).
defeat(wall_nut, baseball_zombie).
defeat(cherry_bomb, backup_dancer).
defeat(sunflower, binary_stars).
defeat(plant_food, blitzer).
defeat(peashooter, bug_zombie).
defeat(cabbage_pult, bungee_zombie).

% Ввод базы сложностей
difficulty(easy).
difficulty(medium).
difficulty(hard).

% Ввод базы времени суток
time_of_day(day).
time_of_day(night).
time_of_day(any).

% Связь растений с их типами
plant_type(peashooter, attack).
plant_type(cabbage_pult, attack).
plant_type(wall_nut, defense).
plant_type(cherry_bomb, attack).
plant_type(sunflower, support).
plant_type(plant_food, support).

% Рекомендации по стилям игры и растениям
rec_plant(Plant, Style) :-
    plant_type(Plant, Type),
    ( (Style == defensive, Type == defense);
      (Style == aggressive, Type == attack);
      (Style == strategic, Type == support) ).

% Рекомендации по уровням сложности
rec_strategy(Difficulty, Plant) :-
    (Difficulty == easy, Plant = sunflower);
    (Difficulty == medium, Plant = peashooter);
    (Difficulty == hard, Plant = wall_nut).

% Определение стратегии на основе уровня сложности
strategy_for_difficulty(Difficulty, Strategy) :-
    recommend_strategy(Difficulty, Strategy).
