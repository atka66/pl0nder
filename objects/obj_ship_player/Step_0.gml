/// @description Insert description here
// You can write your code in this editor
if (alive) {
	if (keyboard_check(ord("A"))) {
		rotation += 3;
	}
	if (keyboard_check(ord("D"))) {
		rotation -= 3;
	}

	if (keyboard_check(ord("W"))) {
		if (fuel > 0) {
			accel = 1;
			fuel -= 0.5;
		} else {
			fuel = 0;
			accel = 0;
		}
	} else {
		accel = 0;
	}


	if (keyboard_check_pressed(ord("F"))) {
		shipShoot(-4);
		shipShoot(4);
	}

	if (keyboard_check_pressed(ord("E"))) {
		if (place_meeting(x, y, obj_dock)) {
			persistGlobals();
			global.currentDockName = obj_dock.name;
			room_goto(r_game_menu_trade);
		}
	}
}