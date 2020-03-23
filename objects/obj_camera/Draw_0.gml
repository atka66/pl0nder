/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player)) {
	x = obj_player.x + (obj_player.hspeed * 20);
	y = obj_player.y + (obj_player.vspeed * 15);
	var scale = 1 + (obj_player.speed / 10);
	camera_set_view_size(view_camera[0], 512 * scale, 384 * scale);
	camera_set_view_border(view_camera[0], 512 * scale / 2, 384 * scale / 2);

	adjustLayer("bg1", scale, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));

	for (var i = 1; i < 4; i++) {
		adjustLayer(
			"bg" + string(i + 1),
			1,
			(camera_get_view_x(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2)) * (1 - (i * 0.05)),
			(camera_get_view_y(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2)) * (1 - (i * 0.05))
		);
	}

	// hud
	var hudX = camera_get_view_x(view_camera[0]) + shakeOffsetX;
	var hudY = camera_get_view_y(view_camera[0]) + shakeOffsetY;
	adjustLayer("hud", scale, hudX, hudY);
	/// speed
	draw_sprite_part_ext(spr_speed, 0, 
		0, sprite_get_height(spr_speed) - (sprite_get_height(spr_speed) * (obj_player.speed / obj_player.speedLimit)), 
		sprite_get_width(spr_speed), sprite_get_height(spr_speed) * (obj_player.speed / obj_player.speedLimit), 
		hudX + (scale * 17),
		hudY + (scale * ((436 - sprite_get_height(spr_speed)) - (sprite_get_height(spr_speed) * (obj_player.speed / obj_player.speedLimit)))),
		scale, scale, c_white, 1.0
	);
	/// hp
	draw_sprite_part_ext(spr_hp, 0, 
		sprite_get_width(spr_hp) - (sprite_get_width(spr_hp) * (obj_player.hp / 100)), 0, 
		(sprite_get_width(spr_hp) * (obj_player.hp / 100)), sprite_get_height(spr_hp), 
		hudX + (scale * ((381 - sprite_get_width(spr_hp)) - (sprite_get_width(spr_hp) * (obj_player.hp / 100)))),
		hudY + (scale * 341),
		scale, scale, c_white, 1.0
	);
}