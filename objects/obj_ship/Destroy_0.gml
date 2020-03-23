/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < 8; i++) {
	instance_create_depth(x + irandom_range(-8, 8), y + irandom_range(-8, 8), -1, obj_explosion);
}