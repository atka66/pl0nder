/// @description Insert description here
// You can write your code in this editor
while (instance_number(obj_asteroid) < asteroidMaxCount) {
	var asteroidSize = irandom_range(1, asteroidMaxSize);
	var dropChance = 0.5;
	with (instance_create_layer(irandom(room_width), irandom(room_height), "fg_objs", obj_asteroid)) {
		image_xscale = 0.5 + (asteroidSize / 2);
		image_yscale = 0.5 + (asteroidSize / 2);
		hp = 50 * (power(2, asteroidSize - 1));
		if (random(1.0) < dropChance) {
			drop = irandom_range(0, asteroidSize - 1);
		}
	}
}