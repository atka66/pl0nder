/// @description Insert description here
// You can write your code in this editor
while (instance_number(obj_asteroid_small) < asteroidLimit) {
	instance_create_layer(irandom(room_width), irandom(room_height), "fg_objs", obj_asteroid_small);
}
if (instance_number(obj_ship_enemy) < 1 && alarm[0] <= 0) {
	alarm[0] = irandom(room_speed * 10);
}