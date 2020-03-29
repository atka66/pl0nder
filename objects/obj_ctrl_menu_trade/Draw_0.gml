/// @description Insert description here
// You can write your code in this editor

// name
drawText(32, 24, global.currentDockName, 3, c_white, 1.0);
// tabs
/// ship
if (selectedTab == 0) {
	draw_sprite(spr_menu_tab, 0, 64, 64);
}
drawText(70, 64, "SHIP", 2, c_white, 1.0);
if (selectedTab == 1) {
	draw_sprite(spr_menu_tab, 0, 160, 64);
}
drawText(166, 64, "CARGO", 2, c_white, 1.0);
if (selectedTab == 2) {
	draw_sprite(spr_menu_tab, 0, 256, 64);
}
drawText(262, 64, "TRADE", 2, c_white, 1.0);
if (selectedTab == 3) {
	draw_sprite(spr_menu_tab, 0, 352, 64);
}
drawText(358, 64, "QUESTS", 2, c_white, 1.0);