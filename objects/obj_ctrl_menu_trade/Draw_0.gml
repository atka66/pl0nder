/// @description Insert description here
// You can write your code in this editor

// name
drawText(24, 16, "WELCOME TO", 2, c_white, 1.0);
drawText(32, 32, global.currentDockName, 3, c_white, 1.0);
// tabs
var tabY = 88;
if (selectedTab == 0) {
	draw_sprite(spr_menu_tab, 0, 64, tabY);
}
drawText(70, tabY, "STATUS", 2, c_white, 1.0);
if (selectedTab == 1) {
	draw_sprite(spr_menu_tab, 0, 160, tabY);
}
drawText(166, tabY, "CARGO", 2, c_white, 1.0);
if (selectedTab == 2) {
	draw_sprite(spr_menu_tab, 0, 256, tabY);
}
drawText(262, tabY, "TRADE", 2, c_white, 1.0);
if (selectedTab == 3) {
	draw_sprite(spr_menu_tab, 0, 352, tabY);
}
drawText(358, tabY, "QUESTS", 2, c_white, 1.0);

// status
if (selectedTab == 0) {
	draw_sprite_ext(spr_menu_player_slot, 0, 128, 212, 6.0, 6.0, 0, c_white, 1.0);
	draw_sprite_ext(spr_ships, global.player_skin, 128, 212, 3.0, 3.0, statusShipRotation, c_white, 1.0);
	drawText(64, 288, "HULL", 2, c_white, 1.0);
	draw_sprite(spr_menu_bar, 0, 64, 300);
	var hpRate = global.player_hp / global.player_maxHp;
	draw_sprite_part(spr_menu_bar, 1, 0, 0, hpRate * sprite_get_width(spr_menu_bar), sprite_get_height(spr_menu_bar), 64, 300);
	drawText(194, 302, string(round(global.player_hp)) + "/" + string(global.player_maxHp), 1, c_white, 1.0);
	drawText(64, 320, "FUEL", 2, c_white, 1.0);
	draw_sprite(spr_menu_bar, 0, 64, 332);
	var fuelRate = global.player_fuel / global.player_maxFuel;
	draw_sprite_part(spr_menu_bar, 2, 0, 0, fuelRate * sprite_get_width(spr_menu_bar), sprite_get_height(spr_menu_bar), 64, 332);
	drawText(194, 334, string(round(global.player_fuel)) + "/" + string(global.player_maxFuel), 1, c_white, 1.0);
	drawText(256, 192, "CREDITS:", 2, c_white, 1.0);
	drawText(384, 192, string(global.player_credit) + "C", 2, c_white, 1.0);
	drawText(256, 224, "CARGO:", 2, c_white, 1.0);
	drawText(384, 224, string(ds_list_size(global.player_inventory)) + "/" + string(global.player_cargoCapacity), 2, c_white, 1.0);
	
	if (global.player_hp < global.player_maxHp) {
		drawText(256, 302, "E - REPAIR", 2, c_white, 1.0);
	}
	if (global.player_fuel < global.player_maxFuel) {
		drawText(256, 334, "F - REFUEL", 2, c_white, 1.0);
	}
}

// cargo
if (selectedTab == 1) {
	drawText(64, 128, string(ds_list_size(global.player_inventory)) + "/" + string(global.player_cargoCapacity), 2, c_white, 1.0);
	if (!ds_list_empty(global.player_inventory)) {
		drawText(128, 128, "E - SELL ALL", 2, c_white, 1.0);
	}
	for (var i = 0; i < global.player_cargoCapacity; i++) {
		var xPos = 64 + ((i mod 10) * 24);
		var yPos = 160 + ((i div 10) * 24);
		draw_sprite(spr_menu_cargo_slot, 0, xPos, yPos);
		if (i < ds_list_size(global.player_inventory)) {
			draw_sprite(spr_minerals, global.player_inventory[|i], xPos, yPos);
		}
	}
}