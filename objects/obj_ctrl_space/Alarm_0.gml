/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < enemySpawn; i++) {
	instance_create_layer(irandom(room_width), irandom(room_height), "fg_objs", obj_ship_enemy);
}