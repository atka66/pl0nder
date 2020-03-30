/// @description Insert description here
// You can write your code in this editor
if (random(1.0) < dropChance) {
	with (instance_create_layer(x, y, "fg_objs", obj_mineral)) {
		mineralType = choose(mineral.iron, mineral.gold, mineral.emerald, mineral.ruby, mineral.diamond);
	}
}
with (instance_create_depth(x, y, -2, obj_explosion)) {
	sprite_index = spr_explosion_big;
}
for (var i = 0; i < 8; i++) {
	instance_create_depth(x, y, -1, obj_asteroid_particle);
}