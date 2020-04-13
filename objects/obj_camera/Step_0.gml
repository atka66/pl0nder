/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_ship_player)) {
	x = obj_ship_player.x + (obj_ship_player.hspeed * 30);
	y = obj_ship_player.y + (obj_ship_player.vspeed * 15);
	if (keyboard_check_pressed(ord("M"))) {
		if (state != hudState.warpMenu) {
			state = hudState.warpMenu;
		} else {
			state = hudState.none;
		}
	}
	if (shakePwr > 0) {
		shakeOffsetX = irandom_range(-shakePwr, shakePwr);
		shakeOffsetY = irandom_range(-shakePwr, shakePwr);
		shakePwr--;
	}
} else {
	if (state != hudState.death) {
		state = hudState.death;
	}
}

if (state == hudState.death) {
	shakeOffsetX = irandom_range(-5, 5);
	shakeOffsetY = irandom_range(-5, 5);
	if (deathDim < 1) {
		deathDim += 0.02;
	} else {
		deathDim = 1;
		if (alarm[0] < 0) {
			alarm[0] = room_speed * 3;
		}
	}
}