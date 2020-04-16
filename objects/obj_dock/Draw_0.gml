/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spriteName, spriteIndex, x, y, 8, 8, 0, c_white, 1.0);
if (distance_to_object(obj_ship_player) < 128) {
	draw_self();
}