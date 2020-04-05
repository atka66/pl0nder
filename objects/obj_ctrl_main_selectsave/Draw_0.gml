/// @description Insert description here
// You can write your code in this editor
// black
draw_sprite_ext(bg_black, 0, 0, 0, 1.0, 1.0, 0, c_white, dim);
// version
drawText(0, room_height - 16, "V" + string(GM_version), 2, c_white, 1.0);
drawText(room_width - 96, room_height - 16, "MADE BY ATKA", 1, c_white, 1.0);
// title
drawText(208, 128, "PL", 6, c_white, 1.0);
drawText(278, 118, "0", 8, c_white, 1.0);
drawText(322, 128, "NDER", 6, c_white, 1.0);

drawText(128, 256, "W - THRUST", 1, c_white, 1.0);
drawText(128, 264, "A - ROTATE LEFT", 1, c_white, 1.0);
drawText(128, 272, "D - ROTATE RIGHT", 1, c_white, 1.0);
drawText(128, 280, "E - DOCK", 1, c_white, 1.0);
drawText(128, 288, "F - SHOOT", 1, c_white, 1.0);

drawText(224, 320, "PRESS SPACE TO START", 2, c_white, 1.0);
// saves
for (var i = 0; i < 3; i++) {
	//drawText(84 + (i * 128), 300, "SLOT " + string(i + 1), 2, c_white, 1.0);
}