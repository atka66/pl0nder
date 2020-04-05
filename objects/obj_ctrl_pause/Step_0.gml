/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(vk_enter)) {
	room_persistent = false;
	room_goto(r_main_selectsave);
}
if (keyboard_check_pressed(vk_space)) {
	instance_destroy();
}