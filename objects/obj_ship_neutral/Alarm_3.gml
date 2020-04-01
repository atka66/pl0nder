/// @description shoot
// You can write your code in this editor
if (alive) {
	accel = 0;
	if (instance_exists(obj_ship_player) && distance_to_object(obj_ship_player) < 300) {
		shipShoot(0, 10);
	}
	alarm[0] = random_range(0.1, 1) * room_speed;
}