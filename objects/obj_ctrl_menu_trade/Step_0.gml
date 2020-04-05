/// @description Insert description here
// You can write your code in this editor
statusShipRotation += 0.5;
if (keyboard_check_pressed(vk_escape)) {
	room_goto(global.currentRoom);
}
if (keyboard_check_pressed(vk_f2)) {
	global.player_credit += 1000;
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
			// upgrade tab
			upgradeSelection = (upgradeSelection + 6 - 1) % 6;
			break;
	}
}
if (keyboard_check_pressed(ord("S"))) {
	switch (selectedTab) {
		case 2:
			// upgrade tab
			upgradeSelection = (upgradeSelection + 1) % 6;
			break;
	}
}
if (keyboard_check_pressed(ord("E"))) {
	switch (selectedTab) {
		case 0:
			// repairing ship
			var missingHp = global.upg_shipHp[# global.player_equipped_shipHp, 2] - global.player_hp;
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
		case 2:
			switch (upgradeSelection) {
				case 0:
					var prevUpgrade = global.player_equipped_shipHp;
					global.player_equipped_shipHp = upgrade(global.upg_shipHp, global.player_equipped_shipHp);
					if (prevUpgrade != global.player_equipped_shipHp) {
						global.player_hp = global.upg_shipHp[# global.player_equipped_shipHp, 2];
					}
					break;
				case 1:
					var prevUpgrade = global.player_equipped_shipFuel;
					global.player_equipped_shipFuel = upgrade(global.upg_shipFuel, global.player_equipped_shipFuel);
					if (prevUpgrade != global.player_equipped_shipFuel) {
						global.player_fuel = global.upg_shipFuel[# global.player_equipped_shipFuel, 2];
					}
					break;
				case 2:
					global.player_equipped_shipCargo = upgrade(global.upg_shipCargo, global.player_equipped_shipCargo);
					break;
				case 3:
					global.player_equipped_laserDmg = upgrade(global.upg_laserDmg, global.player_equipped_laserDmg);
					break;
				case 4:
					global.player_equipped_laserReload = upgrade(global.upg_laserReload, global.player_equipped_laserReload);
					break;
				case 5:
					global.player_equipped_laserCount = upgrade(global.upg_laserCount, global.player_equipped_laserCount);
					break;
			}
			break;
	}
}
if (keyboard_check_pressed(ord("F"))) {
	switch (selectedTab) {
		case 0:
			// refueling ship
			var missingFuel = global.upg_shipFuel[# global.player_equipped_shipFuel, 2] - global.player_fuel;
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
if (keyboard_check_pressed(ord("Q"))) {
	switch (selectedTab) {
		case 0:
			// change color
			var size = array_length_1d(global.ship_colors);
			global.player_skinColor = (global.player_skinColor + size - 1) % size;
			break;
	}
}