/// @description shoot
// You can write your code in this editor
if (alive) {
	accel = 0;
	if (instance_exists(obj_ship_player) && distance_to_object(obj_ship_player) < 400) {
		shipShoot(0, dmg);
	}
	alarm[0] = random_range(0.1, 0.5) * room_speed;
}