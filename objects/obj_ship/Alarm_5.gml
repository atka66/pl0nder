/// @description continuous exploding
// You can write your code in this editor
with (instance_create_depth(x + irandom_range(-8, 8), y + irandom_range(-8, 8), -2, obj_explosion)) {
	sprite_index = spr_explosion_small;
}
instance_create_depth(x, y, -1, obj_wreck);
alarm[5] = room_speed / 4;