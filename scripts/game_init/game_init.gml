gml_pragma("global", "game_init()");

// enable randomization
randomize();

// rooms
global.rooms[0] = r_game_space_1;
global.rooms[1] = r_game_space_2;

surface_resize(application_surface, 512, 384);

// saves
for (var i = 0; i < 3; i++) {
	var savename = "pl0nder_" + string(i) + ".sav";
	if (file_exists(savename)) {
		global.savefiles[i] = file_text_open_read(savename);
	} else {
		global.savefiles[i] = pointer_null;
	}
}

// game metainfo
/*
enum mineral {
	iron = 0,
	gold = 1,
	emerald = 2,
	ruby = 3,
	diamond = 4
}
*/

// minerals
global.minerals = ds_grid_create(2, 5); // #0: display name - #1: value
global.minerals[# 0,0] = "IRON"; global.minerals[# 0,1] = 10;
global.minerals[# 1,0] = "GOLD"; global.minerals[# 1,1] = 20;
global.minerals[# 2,0] = "EMERALD"; global.minerals[# 2,1] = 50;
global.minerals[# 3,0] = "RUBY"; global.minerals[# 3,1] = 100;
global.minerals[# 4,0] = "DIAMOND"; global.minerals[# 4,1] = 200;

global.upg_maxHp = ds_grid_create(3, 4); // #0: display name - #1: value - #2: maxHp
global.upg_maxHp[# 0,0] = "BASIC"; global.upg_maxHp[# 0,1] = 0; global.upg_maxHp[# 0,2] = 100;
global.upg_maxHp[# 1,0] = "STAINLESS STEEL"; global.upg_maxHp[# 1,1] = 1000; global.upg_maxHp[# 1,2] = 200;
global.upg_maxHp[# 2,0] = "TITANIUM"; global.upg_maxHp[# 2,1] = 5000; global.upg_maxHp[# 2,2] = 500;
global.upg_maxHp[# 3,0] = "CARBON NANOTUBE"; global.upg_maxHp[# 3,1] = 20000; global.upg_maxHp[# 3,2] = 1000;

global.upg_maxFuel = ds_grid_create(3, 4); // #0: display name - #1: value - #2: maxHp
global.upg_maxFuel[# 0,0] = "SMALL TANK"; global.upg_maxFuel[# 0,1] = 0; global.upg_maxFuel[# 0,2] = 1000;
global.upg_maxFuel[# 1,0] = "MEDIUM TANK"; global.upg_maxFuel[# 1,1] = 1000; global.upg_maxFuel[# 1,2] = 2000;
global.upg_maxFuel[# 2,0] = "LARGE TANK"; global.upg_maxFuel[# 2,1] = 5000; global.upg_maxFuel[# 2,2] = 5000;
global.upg_maxFuel[# 3,0] = "DOUBLE TANK"; global.upg_maxFuel[# 3,1] = 20000; global.upg_maxFuel[# 3,2] = 10000;

global.upg_laser_dmg = ds_grid_create(3, 4); // #0: display name - #1: value - #2: damage
global.upg_laser_dmg[# 0,0] = "STANDARD"; global.upg_laser_dmg[# 0,1] = 0; global.upg_laser_dmg[# 0,2] = 10;
global.upg_laser_dmg[# 1,0] = "RAILGUN"; global.upg_laser_dmg[# 1,1] = 1000; global.upg_laser_dmg[# 1,2] = 20;
global.upg_laser_dmg[# 2,0] = "ION RAY"; global.upg_laser_dmg[# 2,1] = 5000; global.upg_laser_dmg[# 2,2] = 50;
global.upg_laser_dmg[# 3,0] = "UBERCANNON"; global.upg_laser_dmg[# 3,1] = 20000; global.upg_laser_dmg[# 3,2] = 100;

global.upg_laser_cd = ds_grid_create(3, 3); // #0: display name - #1: value - #2: cooldown
global.upg_laser_cd[# 0,0] = "SLOW"; global.upg_laser_cd[# 0,1] = 0; global.upg_laser_cd[# 0,2] = 30;
global.upg_laser_cd[# 1,0] = "MEDIUM"; global.upg_laser_cd[# 1,1] = 5000; global.upg_laser_cd[# 1,2] = 15;
global.upg_laser_cd[# 2,0] = "FAST"; global.upg_laser_cd[# 2,1] = 20000; global.upg_laser_cd[# 2,2] = 5;

global.upg_laser_count = ds_grid_create(3, 3); // #0: display name - #1: value - #2: count
global.upg_laser_count[# 0,0] = "ONE"; global.upg_laser_count[# 0,1] = 0; global.upg_laser_count[# 0,2] = 1;
global.upg_laser_count[# 1,0] = "TWO"; global.upg_laser_count[# 1,1] = 10000; global.upg_laser_count[# 1,2] = 2;
global.upg_laser_count[# 2,0] = "THREE"; global.upg_laser_count[# 2,1] = 50000; global.upg_laser_count[# 2,2] = 3;

global.currentDockName = "UNNAMED";

// player info
global.player_skin = 0;
global.player_skinColor = c_blue;
global.player_credit = 0;
global.player_maxHp = 100;
global.player_hp = 100;
global.player_maxFuel = 1000;
global.player_fuel = 1000;
global.player_cargoCapacity = 5;
global.player_cargo = ds_list_create();

global.player_equipped_maxHp = 0;
global.player_equipped_maxFuel = 0;
global.player_equipped_laser_dmg = 0;
global.player_equipped_laser_cd = 0;
global.player_equipped_laser_count = 0;