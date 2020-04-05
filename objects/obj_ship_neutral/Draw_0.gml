/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_sprite_ext(spr_ships, skinImage, x, y, 1.0, 1.0, rotation, c_white, 1.0);
draw_sprite_ext(spr_ships_color, skinImage, x, y, 1.0, 1.0, rotation, global.ship_colors[skinColor], 1.0);