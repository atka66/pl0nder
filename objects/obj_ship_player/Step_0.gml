/// @description Insert description here
// You can write your code in this editor
if (alive) {
	if (cd > 0) {
		cd--;
	}
	if (keyboard_check(ord("A"))) {
		rotation += 3;
	}
	if (keyboard_check(ord("D"))) {
		rotation -= 3;
	}

	if (keyboard_check(ord("W"))) {
		if (fuel > 0) {
			accel = 1;
			fuel -= 0.2;
		} else {
			fuel = 0;
			accel = 0;
		}
	} else {
		accel = 0;
	}


	if (keyboard_check(ord("F"))) {
		if (cd == 0) {
			cd = global.upg_laserReload[# global.player_equipped_laserReload, 2] * room_speed;
			var laserCount = global.upg_laserCount[# global.player_equipped_laserCount, 2];
			for (var i = 0; i < laserCount; i++) {
				shipShoot(((32 / (laserCount + 1)) * (i + 1) - 16), global.upg_laserDmg[# global.player_equipped_laserDmg, 2]);
			}
		}
	}

	if (keyboard_check_pressed(ord("E"))) {
		if (place_meeting(x, y, obj_dock)) {
			globalizeVars();
			global.currentDockName = obj_dock.name;
			room_goto(r_game_menu_trade);
			alarm[6] = 1;
		}
	}
}