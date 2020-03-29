/// @description Insert description here
// You can write your code in this editor
with (instance_create_depth(x, y, -2, obj_explosion)) {
	sprite_index = spr_explosion_big;
}
for (var i = 0; i < 8; i++) {
	instance_create_depth(x, y, -1, obj_wreck);
}