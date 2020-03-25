/// @description Insert description here
// You can write your code in this editor
alarm[0] = room_speed;
with (instance_create_depth(253, 138, -1, obj_mainmenu_angle)) {
	side = 1;
	slideSpeed = 11;
	image_angle = side * 90;
	direction = side * 90;
	vspeed = -side * 5;

}
with (instance_create_depth(253, 138, -1, obj_mainmenu_angle)) {
	side = -1;
	slideSpeed = 11;
	image_angle = side * 90;
	direction = side * 90;
	vspeed = -side * 5;
}