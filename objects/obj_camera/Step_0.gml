/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player)) {
	if (keyboard_check_pressed(ord("M"))) {
		
	}
	if (shakePwr > 0) {
		shakeOffsetX = irandom_range(-shakePwr, shakePwr);
		shakeOffsetY = irandom_range(-shakePwr, shakePwr);
		shakePwr--;
	}
} else {
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