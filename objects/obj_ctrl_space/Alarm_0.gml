/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < enemySpawn; i++) {
	with (instance_create_layer(irandom(room_width), irandom(room_height), "fg_objs", obj_ship_neutral)) {
		hp = 100;
		bounty = 100;
	}
}