/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player)) {
	x = obj_player.x + (obj_player.hspeed * 20);
	y = obj_player.y + (obj_player.vspeed * 15);
	camX = camera_get_view_x(view_camera[0]);
	camY = camera_get_view_y(view_camera[0]);
	scale = 1 + (obj_player.speed / 10);
	camera_set_view_size(view_camera[0], 512 * scale, 384 * scale);
	camera_set_view_border(view_camera[0], 512 * scale / 2, 384 * scale / 2);

	adjustLayer("bg1", scale, camX, camY);

	for (var i = 1; i < 4; i++) {
		adjustLayer(
			"bg" + string(i + 1), 1,
			(camX + (camera_get_view_width(view_camera[0]) / 2)) * (1 - (i * 0.05)),
			(camY + (camera_get_view_height(view_camera[0]) / 2)) * (1 - (i * 0.05))
		);
	}
}

var hudX = camX + shakeOffsetX;
var hudY = camY + shakeOffsetY;
// death overlay
draw_sprite_ext(bg_black, 0, camX, camY, scale, scale, 0, c_white, deathDim);
drawText(camX + (scale * 192), camY + (scale * 180), "WRECKED", scale * 3, c_white, deathDim);
// hud
var speedRate = instance_exists(obj_player) ? obj_player.speed / obj_player.speedLimit : 0;
var hpRate = instance_exists(obj_player) ? obj_player.hp / obj_player.maxHp : 0;
draw_sprite_ext(spr_hud, 0, hudX, hudY, scale, scale, 0, c_white, 0.2);
/// text
drawText(hudX + (scale * 18), hudY + (scale * 266), "SPEED", scale, c_white, 0.5);
drawText(hudX + (scale * 226), hudY + (scale * 334), "HULL", scale, c_white, 0.5);
drawText(hudX + (scale * 264), hudY + (scale * 334), "FUEL", scale, c_white, 0.5);
/// speed
draw_sprite_part_ext(spr_speed, 0, 
	0, sprite_get_height(spr_speed) - (sprite_get_height(spr_speed) * speedRate), 
	sprite_get_width(spr_speed), sprite_get_height(spr_speed) * speedRate, 
	hudX + (scale * 17),
	hudY + (scale * ((436 - sprite_get_height(spr_speed)) - (sprite_get_height(spr_speed) * speedRate))),
	scale, scale, c_white, 0.3
);
/// hp
draw_sprite_part_ext(spr_hp, 0, 
	sprite_get_width(spr_hp) - (sprite_get_width(spr_hp) * hpRate), 0, 
	(sprite_get_width(spr_hp) * hpRate), sprite_get_height(spr_hp), 
	hudX + (scale * ((381 - sprite_get_width(spr_hp)) - (sprite_get_width(spr_hp) * hpRate))),
	hudY + (scale * 341),
	scale, scale, c_white, 0.3
);