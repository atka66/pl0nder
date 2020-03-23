/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr_ships, skinImage, x, y, 1.0, 1.0, rotation, c_white, 1.0);
if (accel > 0) {
	draw_sprite_ext(spr_trail, 0, x, y, 1.0, 1.0, rotation, c_white, 1.0);
}