gml_pragma("global", "game_init()");

// rooms
global.rooms[0] = r_game_space_1;

surface_resize(application_surface, 680, 384);

// saves
for (var i = 0; i < 3; i++) {
	var savename = "pl0nder_" + string(i) + ".sav";
	if (file_exists(savename)) {
		global.savefiles[i] = file_text_open_read(savename);
	} else {
		global.savefiles[i] = pointer_null;
	}
}

// ship colors
global.ship_colors[0] = c_blue; global.ship_colors[1] = c_aqua; global.ship_colors[2] = c_green;
global.ship_colors[3] = c_lime; global.ship_colors[4] = c_yellow; global.ship_colors[5] = c_orange;
global.ship_colors[6] = c_red; global.ship_colors[7] = c_purple; global.ship_colors[8] = c_black;
global.ship_colors[9] = c_white;

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

global.upg_shipCargo = ds_grid_create(4, 3); // #0: display name - #1: value - #2: maxCapacity
global.upg_shipCargo[# 0,0] = "S CONTAINER"; global.upg_shipCargo[# 0,1] = 0; global.upg_shipCargo[# 0,2] = 5;
global.upg_shipCargo[# 1,0] = "M CONTAINER"; global.upg_shipCargo[# 1,1] = 1000; global.upg_shipCargo[# 1,2] = 10;
global.upg_shipCargo[# 2,0] = "L CONTAINER"; global.upg_shipCargo[# 2,1] = 5000; global.upg_shipCargo[# 2,2] = 20;
global.upg_shipCargo[# 3,0] = "XL CONTAINER"; global.upg_shipCargo[# 3,1] = 20000; global.upg_shipCargo[# 3,2] = 50;

global.upg_laserDmg = ds_grid_create(4, 3); // #0: display name - #1: value - #2: damage
global.upg_laserDmg[# 0,0] = "STANDARD"; global.upg_laserDmg[# 0,1] = 0; global.upg_laserDmg[# 0,2] = 10;
global.upg_laserDmg[# 1,0] = "RAILGUN"; global.upg_laserDmg[# 1,1] = 1000; global.upg_laserDmg[# 1,2] = 20;
global.upg_laserDmg[# 2,0] = "ION RAY"; global.upg_laserDmg[# 2,1] = 5000; global.upg_laserDmg[# 2,2] = 50;
global.upg_laserDmg[# 3,0] = "UBERCANNON"; global.upg_laserDmg[# 3,1] = 20000; global.upg_laserDmg[# 3,2] = 100;

global.upg_laserReload = ds_grid_create(3, 3); // #0: display name - #1: value - #2: cooldown
global.upg_laserReload[# 0,0] = "SLOW"; global.upg_laserReload[# 0,1] = 0; global.upg_laserReload[# 0,2] = 0.5;
global.upg_laserReload[# 1,0] = "MEDIUM"; global.upg_laserReload[# 1,1] = 5000; global.upg_laserReload[# 1,2] = 0.25;
global.upg_laserReload[# 2,0] = "FAST"; global.upg_laserReload[# 2,1] = 20000; global.upg_laserReload[# 2,2] = 0.1;

global.upg_laserCount = ds_grid_create(3, 3); // #0: display name - #1: value - #2: count
global.upg_laserCount[# 0,0] = "ONE"; global.upg_laserCount[# 0,1] = 0; global.upg_laserCount[# 0,2] = 1;
global.upg_laserCount[# 1,0] = "TWO"; global.upg_laserCount[# 1,1] = 10000; global.upg_laserCount[# 1,2] = 2;
global.upg_laserCount[# 2,0] = "THREE"; global.upg_laserCount[# 2,1] = 50000; global.upg_laserCount[# 2,2] = 3;

global.currentDockName = "UNNAMED";