/// @description Insert description here
// You can write your code in this editor
// black
draw_sprite_ext(bg_black, 0, 0, 0, 1.0, 1.0, 0, c_white, dim);
// version
drawText(0, room_height - 16, "V" + string(GM_version), 2, c_white, 1.0);
// title
drawText(124, 128, "PL", 6, c_white, 1.0);
drawText(194, 118, "0", 8, c_white, 1.0);
drawText(238, 128, "NDER", 6, c_white, 1.0);
// saves
for (var i = 0; i < 3; i++) {
	//drawText(84 + (i * 128), 300, "SLOT " + string(i + 1), 2, c_white, 1.0);
}