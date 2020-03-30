/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(vk_escape)) {
	room_goto(global.currentRoom);
}
if (keyboard_check_pressed(ord("A"))) {
	selectedTab = (selectedTab + 4 - 1) % 4;
}
if (keyboard_check_pressed(ord("D"))) {
	selectedTab = (selectedTab + 1) % 4;
}

if (keyboard_check_pressed(ord("E"))) {
	switch (selectedTab) {
		case 0:
			var missingHp = global.player_maxHp - global.player_hp;
			if (missingHp > 0) {
				var repairCost = round(missingHp * 10);
				if (global.player_credit > repairCost) {
					global.player_hp += missingHp;
					global.player_credit -= repairCost;
				}
			}
			break;
		case 1:
			for (var i = ds_list_size(global.player_inventory) - 1; i >= 0; i--) {
				global.player_credit += 200;
				ds_list_delete(global.player_inventory, i);
			}
			break;
	}
}
if (keyboard_check_pressed(ord("F"))) {
	switch (selectedTab) {
		case 0:
			var missingFuel = global.player_maxFuel - global.player_fuel;
			if (missingFuel > 0) {
				var refuelCost = round(missingFuel);
				if (global.player_credit > refuelCost) {
					global.player_fuel += missingFuel;
					global.player_credit -= refuelCost;
				}
			}
			break;
	}
}

statusShipRotation += 0.5;