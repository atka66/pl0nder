/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_ship_player)) {
	camX = camera_get_view_x(view_camera[0]);
	camY = camera_get_view_y(view_camera[0]);
	scale = 1 + (obj_ship_player.speed / 10);
	camera_set_view_size(view_camera[0], 680 * scale, 384 * scale);
	camera_set_view_border(view_camera[0], 680 * scale / 2, 384 * scale / 2);

	adjustLayer("bg_space", scale, camX, camY);

	for (var i = 2; i < 5; i++) {
		adjustLayer(
			"bg_stars_" + string(i - 1), 1,
			(camX + (camera_get_view_width(view_camera[0]) / 2)) * (1 - (i * 0.05)),
			(camY + (camera_get_view_height(view_camera[0]) / 2)) * (1 - (i * 0.05))
		);
	}
}