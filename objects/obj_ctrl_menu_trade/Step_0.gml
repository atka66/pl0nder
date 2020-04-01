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
if (keyboard_check_pressed(ord("W"))) {
	switch (selectedTab) {
		case 2:
			// upgrade
			upgradeSelection = (upgradeSelection + 5 - 1) % 5;
			break;
	}
}
if (keyboard_check_pressed(ord("S"))) {
	switch (selectedTab) {
		case 2:
			// upgrade
			upgradeSelection = (upgradeSelection + 1) % 5;
			break;
	}
}

if (keyboard_check_pressed(ord("E"))) {
	switch (selectedTab) {
		case 0:
			// repairing ship
			var missingHp = global.player_maxHp - global.player_hp;
			if (missingHp > 0) {
				var repairCost = round(missingHp);
				if (global.player_credit > repairCost) {
					global.player_hp += missingHp;
					global.player_credit -= repairCost;
				}
			}
			break;
		case 1:
			// selling cargo content
			for (var i = ds_list_size(global.player_cargo) - 1; i >= 0; i--) {
				global.player_credit += global.minerals[# global.player_cargo[|i], 1];
				ds_list_delete(global.player_cargo, i);
			}
			break;
	}
}
if (keyboard_check_pressed(ord("F"))) {
	switch (selectedTab) {
		case 0:
			// refueling ship
			var missingFuel = global.player_maxFuel - global.player_fuel;
			if (missingFuel > 0) {
				var refuelCost = round(missingFuel / 10);
				if (global.player_credit > refuelCost) {
					global.player_fuel += missingFuel;
					global.player_credit -= refuelCost;
				}
			}
			break;
	}
}

statusShipRotation += 0.5;