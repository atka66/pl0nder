/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_anykey)) {
	if (keyboard_check_pressed(vk_escape)) {
		game_end();
	} else {
		room_goto(r_main_selectsave);
	}
}