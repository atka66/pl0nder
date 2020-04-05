// player info
global.player_equipped_shipHp = 0;
global.player_equipped_shipFuel = 0;
global.player_equipped_shipCargo = 0;
global.player_equipped_laserDmg = 0;
global.player_equipped_laserReload = 0;
global.player_equipped_laserCount = 0;

global.player_skin = 0;
global.player_skinColor = 0;
global.player_credit = 0;
global.player_hp = global.upg_shipHp[# global.player_equipped_shipHp, 2];
global.player_fuel = global.upg_shipFuel[# global.player_equipped_shipFuel, 2];;
global.player_cargo = ds_list_create();