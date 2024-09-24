% База знаний на основе игры "Растения против зомби"

% Ввод базы растений
plant(peashooter).
plant(sunflower).
plant(wall_nut).
plant(squash).
plant(threepeater).
plant(spikeweed).
plant(jalapeno).
plant(torchwood).
plant(blover).
plant(starfruit).

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

% Типы атак растений 
attack_type(peashooter, ranged).
attack_type(squash, melee).
attack_type(spikeweed, ground).
attack_type(jalapeno, explosive).
attack_type(torchwood, support).
attack_type(blover, utility).
attack_type(starfruit, ranged).
attack_type(threepeater, ranged).

% Урон растений
damage(peashooter, 20).
damage(squash, 80).
damage(spikeweed, 10).
damage(jalapeno, 100).
damage(torchwood, 0).
damage(blover, 0).
damage(starfruit, 50).
damage(threepeater, 50).

% Типы зомби
zombie_type(backup_dancer, summoner).
zombie_type(balloon_zombie, aerial).
zombie_type(barrel_pirate, armored).
zombie_type(baseball_zombie, agile).
zombie_type(binary_stars, boss).
zombie_type(black_hole, boss).
zombie_type(blitzer, fast).
zombie_type(boombox_zombie, disruptor).
zombie_type(bug_zombie, small).
zombie_type(bungee_zombie, aerial).

% Здоровье зомби
zombie_health(backup_dancer, 50).
zombie_health(balloon_zombie, 50).
zombie_health(barrel_pirate, 200).
zombie_health(baseball_zombie, 60).
zombie_health(binary_stars, 1000).
zombie_health(black_hole, 1000).
zombie_health(blitzer, 70).
zombie_health(boombox_zombie, 300).
zombie_health(bug_zombie, 500).
zombie_health(bungee_zombie, 50).

% Способность атаковать воздушных зомби
aerial_plant(peashooter).
aerial_plant(starfruit).
aerial_plant(threepeater).
aerial_plant(blover).

% Зомби BOSS
is_boss(binary_stars).
is_boss(black_hole).


% Правила

% Растения, которые могут убить зомби с высоким здоровьем
effective_plant(Plant, Zombie) :-
    zombie_health(Zombie, Health), Health > 50,
    damage(Plant, Damage), Damage > 50.


% Растения, которые могут уничтожить быстрых зомби
fast_zombie(Plant, Zombie) :-
     zombie_type(Zombie, fast),
     (damage(Plant, high); Plant = wall_nut).

% Борьба с особенными возможностями
special_zombie(Plant, Zombie) :-
     (zombie_type(Zombie, aerial), aerial_plant(Plant), damage(Plant, Damage), Damage \= none);
     (is_boss(Zombie), damage(Plant, high)).

% Для массового уничтожения зомби
mass_destruction_plant(Plant) :-
     plant(Plant),
     (attack_type(Plant, explosive); attack_type(Plant, ranged)).

% % Комбинированная защита
% combined_defense(Plant1, Plant2, Zombie) :-
%     plant(Plant1),q
%     plant(Plant2),
%     attack_type(Plant1, support),
%     damage(Plant2, high),
%     zombie_type(Zombie, boss).

% % Зомби, которые требуют специальной атаки для уничтожения
% requires_special_attack(Zombie, Plant) :-
%     (zombie_type(Zombie, aerial), attack_type(Plant, ranged));
%     (zombie_type(Zombie, armored), attack_type(Plant, explosive));
%     (zombie_type(Zombie, fast), attack_type(Plant, melee)).

% % Оптимальное растение для любого зомби
% optimal_plant(Zombie, Plant) :-
%     zombie_type(Zombie, Type),
%     zombie_health(Zombie, Health),
%     (Type = aerial, aerial_plant(Plant), damage(Plant, medium));
%     (Type = armored, attack_type(Plant, explosive), damage(Plant, high));
%     (Health = low, damage(Plant, low)).




