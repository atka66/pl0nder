/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(vk_escape)) {
	room_goto(r_main_pressanykey);
}
if (keyboard_check_pressed(vk_space)) {
	initGameVars();
	room_goto(r_game_space_1);
}

if (appearBackground) {
	if (dim > 0) {
		dim -= 0.02;
	} else {
		dim = 0;
	}
}