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

/// game metainfo
enum mineral {
	iron = 0,
	gold = 1,
	emerald = 2,
	ruby = 3,
	diamond = 4
}

global.currentDockName = "UNNAMED";
// player info
global.player_skin = 0;
global.player_credit = 0;
global.player_maxHp = 100;
global.player_hp = 100;
global.player_maxFuel = 1000;
global.player_fuel = 1000;
global.player_cargoCapacity = 5;
global.player_inventory = ds_list_create();