/// @description Insert description here
// You can write your code in this editor
while (instance_number(obj_asteroid) < asteroidLimit) {
	var asteroidSize = irandom_range(1, maxAsteroidSize);
	var dropCh = dropChance;
	with (instance_create_layer(irandom(room_width), irandom(room_height), "fg_objs", obj_asteroid)) {
		image_xscale = 0.5 + (asteroidSize / 2);
		image_yscale = 0.5 + (asteroidSize / 2);
		hp = 50 * (power(2, asteroidSize - 1));
		if (random(1.0) < dropCh) {
			drop = irandom_range(0, asteroidSize - 1);
		}
	}
}
if (instance_number(obj_ship_neutral) < 1 && alarm[0] <= 0) {
	alarm[0] = irandom(room_speed * 10);
}