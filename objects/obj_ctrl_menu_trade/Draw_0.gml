/// @description Insert description here
// You can write your code in this editor

// name
drawText(24, 16, "WELCOME TO", 2, c_white, 1.0);
drawText(36, 32, global.currentDockName, 4, c_white, 1.0);
// tabs
var tabY = 88;
if (selectedTab == 0) {
	draw_sprite(spr_menu_tab, 0, 48, tabY);
}
drawText(54, tabY, "STATUS", 2, c_white, 1.0);
if (selectedTab == 1) {
	draw_sprite(spr_menu_tab, 0, 152, tabY);
}
drawText(158, tabY, "CARGO", 2, c_white, 1.0);
if (selectedTab == 2) {
	draw_sprite(spr_menu_tab, 0, 256, tabY);
}
drawText(262, tabY, "UPGRADE", 2, c_white, 1.0);
if (selectedTab == 3) {
	draw_sprite(spr_menu_tab, 0, 360, tabY);
}
drawText(366, tabY, "QUESTS", 2, c_white, 1.0);

// status
if (selectedTab == 0) {
	draw_sprite_ext(spr_menu_box_slot, 0, 128, 192, 6.0, 6.0, 0, c_white, 1.0);
	draw_sprite_ext(spr_ships, global.player_skin, 128, 192, 3.0, 3.0, statusShipRotation, c_white, 1.0);
	draw_sprite_ext(spr_ships_color, global.player_skin, 128, 192, 3.0, 3.0, statusShipRotation, global.player_skinColor, 0.7);
	
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
	
	drawText(216, 128, "HULL:", 2, c_white, 0.8);
	drawText(288, 128, global.upg_maxHp[# global.player_equipped_maxHp, 0], 2, c_white, 1.0);
	drawText(216, 152, "TANK:", 2, c_white, 0.8);
	drawText(288, 152, global.upg_maxFuel[# global.player_equipped_maxFuel, 0], 2, c_white, 1.0);
	drawText(216, 176, "ARMS:", 2, c_white, 0.8);
	drawText(288, 176, global.upg_laser_dmg[# global.player_equipped_laser_dmg, 0], 2, c_white, 1.0);
	drawText(216, 192, "SPEED:", 2, c_white, 0.8);
	drawText(288, 192, global.upg_laser_cd[# global.player_equipped_laser_cd, 0], 2, c_white, 1.0);
	drawText(216, 208, "COUNT:", 2, c_white, 0.8);
	drawText(288, 208, global.upg_laser_count[# global.player_equipped_laser_count, 0], 2, c_white, 1.0);
	
	if (global.player_hp < global.player_maxHp) {
		drawText(256, 302, "E - REPAIR", 2, c_white, 1.0);
	}
	if (global.player_fuel < global.player_maxFuel) {
		drawText(256, 334, "F - REFUEL", 2, c_white, 1.0);
	}
}

// cargo
if (selectedTab == 1) {
	drawText(64, 128, string(ds_list_size(global.player_cargo)) + "/" + string(global.player_cargoCapacity), 2, c_white, 1.0);
	if (!ds_list_empty(global.player_cargo)) {
		drawText(128, 128, "E - SELL ALL", 2, c_white, 1.0);
	}
	for (var i = 0; i < global.player_cargoCapacity; i++) {
		var xPos = 64 + ((i mod 10) * 24);
		var yPos = 160 + ((i div 10) * 24);
		draw_sprite(spr_menu_box_slot, 0, xPos, yPos);
		if (i < ds_list_size(global.player_cargo)) {
			draw_sprite(spr_minerals, global.player_cargo[|i], xPos, yPos);
		}
	}
}

// upgrade
if (selectedTab == 2) {
	drawUpgradeSlot(144, global.upg_maxHp, global.player_equipped_maxHp, "SHIP HP");
	drawUpgradeSlot(192, global.upg_maxFuel, global.player_equipped_maxFuel, "FUEL UNIT");
	drawUpgradeSlot(240, global.upg_laser_dmg, global.player_equipped_laser_dmg, "LASER DAMAGE");
	drawUpgradeSlot(288, global.upg_laser_cd, global.player_equipped_laser_cd, "FIRING RATE");
	drawUpgradeSlot(336, global.upg_laser_count, global.player_equipped_laser_count, "TURRETS");
}