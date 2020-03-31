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
global.minerals = ds_grid_create(3, 5); // #0: display name - #1: image_index - #2: value
global.minerals[# 0,0] = "IRON"; global.minerals[# 0,1] = 0; global.minerals[# 0,2] = 10;
global.minerals[# 1,0] = "GOLD"; global.minerals[# 1,1] = 1; global.minerals[# 1,2] = 20;
global.minerals[# 2,0] = "EMERALD"; global.minerals[# 2,1] = 2; global.minerals[# 2,2] = 50;
global.minerals[# 3,0] = "RUBY"; global.minerals[# 3,1] = 3; global.minerals[# 3,2] = 100;
global.minerals[# 4,0] = "DIAMOND"; global.minerals[# 4,1] = 4; global.minerals[# 4,2] = 200;

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
global.player_inventory = ds_list_create();