/// @description rotate
// You can write your code in this editor
accel = 0;
if (instance_exists(obj_player)) {
	rotation = point_direction(x, y, obj_player.x, obj_player.y);
}
alarm[3] = random_range(0.1, 0.3) * room_speed;