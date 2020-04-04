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

// minerals
global.minerals = ds_grid_create(5, 2); // #0: display name - #1: value
global.minerals[# 0,0] = "IRON"; global.minerals[# 0,1] = 10;
global.minerals[# 1,0] = "GOLD"; global.minerals[# 1,1] = 20;
global.minerals[# 2,0] = "EMERALD"; global.minerals[# 2,1] = 50;
global.minerals[# 3,0] = "RUBY"; global.minerals[# 3,1] = 100;
global.minerals[# 4,0] = "DIAMOND"; global.minerals[# 4,1] = 200;

// upgrades
global.upg_shipHp = ds_grid_create(4, 3); // #0: display name - #1: value - #2: maxHp
global.upg_shipHp[# 0,0] = "BASIC"; global.upg_shipHp[# 0,1] = 0; global.upg_shipHp[# 0,2] = 100;
global.upg_shipHp[# 1,0] = "STAINLESS STEEL"; global.upg_shipHp[# 1,1] = 1000; global.upg_shipHp[# 1,2] = 200;
global.upg_shipHp[# 2,0] = "TITANIUM"; global.upg_shipHp[# 2,1] = 5000; global.upg_shipHp[# 2,2] = 500;
global.upg_shipHp[# 3,0] = "CARBON NANOTUBE"; global.upg_shipHp[# 3,1] = 20000; global.upg_shipHp[# 3,2] = 1000;

global.upg_shipFuel = ds_grid_create(4, 3); // #0: display name - #1: value - #2: maxFuel
global.upg_shipFuel[# 0,0] = "SMALL TANK"; global.upg_shipFuel[# 0,1] = 0; global.upg_shipFuel[# 0,2] = 1000;
global.upg_shipFuel[# 1,0] = "MEDIUM TANK"; global.upg_shipFuel[# 1,1] = 1000; global.upg_shipFuel[# 1,2] = 2000;
global.upg_shipFuel[# 2,0] = "LARGE TANK"; global.upg_shipFuel[# 2,1] = 5000; global.upg_shipFuel[# 2,2] = 5000;
global.upg_shipFuel[# 3,0] = "DOUBLE TANK"; global.upg_shipFuel[# 3,1] = 20000; global.upg_shipFuel[# 3,2] = 10000;
// todo speed + cargo
global.upg_laserDmg = ds_grid_create(4, 3); // #0: display name - #1: value - #2: damage
global.upg_laserDmg[# 0,0] = "STANDARD"; global.upg_laserDmg[# 0,1] = 0; global.upg_laserDmg[# 0,2] = 10;
global.upg_laserDmg[# 1,0] = "RAILGUN"; global.upg_laserDmg[# 1,1] = 1000; global.upg_laserDmg[# 1,2] = 20;
global.upg_laserDmg[# 2,0] = "ION RAY"; global.upg_laserDmg[# 2,1] = 5000; global.upg_laserDmg[# 2,2] = 50;
global.upg_laserDmg[# 3,0] = "UBERCANNON"; global.upg_laserDmg[# 3,1] = 20000; global.upg_laserDmg[# 3,2] = 100;

global.upg_laserReload = ds_grid_create(3, 3); // #0: display name - #1: value - #2: cooldown
global.upg_laserReload[# 0,0] = "SLOW"; global.upg_laserReload[# 0,1] = 0; global.upg_laserReload[# 0,2] = 1.0;
global.upg_laserReload[# 1,0] = "MEDIUM"; global.upg_laserReload[# 1,1] = 5000; global.upg_laserReload[# 1,2] = 0.5;
global.upg_laserReload[# 2,0] = "FAST"; global.upg_laserReload[# 2,1] = 20000; global.upg_laserReload[# 2,2] = 0.2;

global.upg_laserCount = ds_grid_create(3, 3); // #0: display name - #1: value - #2: count
global.upg_laserCount[# 0,0] = "ONE"; global.upg_laserCount[# 0,1] = 0; global.upg_laserCount[# 0,2] = 1;
global.upg_laserCount[# 1,0] = "TWO"; global.upg_laserCount[# 1,1] = 10000; global.upg_laserCount[# 1,2] = 2;
global.upg_laserCount[# 2,0] = "THREE"; global.upg_laserCount[# 2,1] = 50000; global.upg_laserCount[# 2,2] = 3;

global.currentDockName = "UNNAMED";

// player info
global.player_equipped_shipHp = 0;
global.player_equipped_shipFuel = 0;
global.player_equipped_laserDmg = 0;
global.player_equipped_laserReload = 0;
global.player_equipped_laserCount = 2;

global.player_skin = 0;
global.player_skinColor = c_blue;
global.player_credit = 0;
global.player_hp = global.upg_shipHp[# global.player_equipped_shipHp, 2];
global.player_fuel = global.upg_shipFuel[# global.player_equipped_shipFuel, 2];;
global.player_cargoCapacity = 5;
global.player_cargo = ds_list_create();