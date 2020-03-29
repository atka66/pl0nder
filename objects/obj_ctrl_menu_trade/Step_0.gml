/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("A"))) {
	selectedTab = (selectedTab + 4 - 1) % 4;
}
if (keyboard_check_pressed(ord("D"))) {
	selectedTab = (selectedTab + 1) % 4;
}