/// @description Insert description here
// You can write your code in this editor
var hudX = shakeOffsetX;
var hudY = shakeOffsetY;
// death overlay
if (state == hudState.death) {
	draw_sprite_ext(bg_black, 0, 0, 0, 1.0, 1.0, 0, c_white, deathDim);
	drawText(274, 180, "WRECKED", 3, c_white, deathDim);
}
// hud
draw_sprite_ext(spr_hud, 0, hudX, hudY, 1.0, 1.0, 0, c_white, 0.2);
/// text
drawText(hudX + 18, hudY + 266, "SPEED", 1.0, c_white, 0.5);
drawText(hudX + 310, hudY + 334, "HULL", 1.0, c_white, 0.5);
drawText(hudX + 348, hudY + 334, "FUEL", 1.0, c_white, 0.5);

/// player specific
if (state != hudState.death && instance_exists(obj_ship_player)) {
	//// speed
	var speedRate = obj_ship_player.speed / obj_ship_player.speedLimit;
	draw_sprite_part_ext(spr_hud_speedbar, 0, 
		0, sprite_get_height(spr_hud_speedbar) - (sprite_get_height(spr_hud_speedbar) * speedRate), 
		sprite_get_width(spr_hud_speedbar), sprite_get_height(spr_hud_speedbar) * speedRate, 
		hudX + 17, hudY + ((436 - sprite_get_height(spr_hud_speedbar)) - (sprite_get_height(spr_hud_speedbar) * speedRate)),
		1.0, 1.0, c_white, 0.5
	);
	//// hp
	var hpRate = obj_ship_player.hp / global.upg_shipHp[# global.player_equipped_shipHp, 2];
	var hpColor = c_white;
	if (hpRate <= 0.25) {
		hpColor = c_red;
		if (floor(current_time / 250) % 2 == 0) {
			drawText(hudX + 219, hudY + 346, "WARNING", 1.0, c_red, 0.5);
		}
	}
	draw_sprite_part_ext(spr_hud_hpbar, 0, 
		sprite_get_width(spr_hud_hpbar) - (sprite_get_width(spr_hud_hpbar) * hpRate), 0, 
		(sprite_get_width(spr_hud_hpbar) * hpRate), sprite_get_height(spr_hud_hpbar), 
		hudX + ((465 - sprite_get_width(spr_hud_hpbar)) - (sprite_get_width(spr_hud_hpbar) * hpRate)),
		hudY + 341, 1.0, 1.0, hpColor, 0.5
	);
	//// fuel
	var fuelRate = obj_ship_player.fuel / global.upg_shipFuel[# global.player_equipped_shipFuel, 2];
	var fuelColor = c_white;
	if (fuelRate <= 0.25) {
		fuelColor = c_red;
		if (floor(current_time / 250) % 2 == 0) {
			drawText(hudX + 425, hudY + 346, "WARNING", 1.0, c_red, 0.5);
		}
	}
	draw_sprite_part_ext(
		spr_hud_fuelbar, 0, 0, 0, (sprite_get_width(spr_hud_fuelbar) * fuelRate), sprite_get_height(spr_hud_fuelbar), 
		hudX + 341, hudY + 341, 1.0, 1.0, fuelColor, 0.5
	);
	//// credit
	drawText(hudX + 24, hudY + 304, "CREDITS: " + string(global.player_credit) + "C", 1.0, c_white, 0.5);
	//// cargo
	drawText(
		hudX + 24, hudY + 312, 
		"CARGO: " + string(ds_list_size(global.player_cargo)) + "/" + string(global.upg_shipCargo[# global.player_equipped_shipCargo, 2]), 
		1.0, c_white, 0.5
	);
	//// tooltip
	with (obj_ship_player) {
		var dockInst = instance_place(x, y, obj_dock);
		if (dockInst != noone){
			drawText(hudX + 96, hudY + 288, "E - DOCK TO " + dockInst.name, 2, c_white, 0.5);
		}
	}
	//// target
	if (currentTarget != noone) {
		var targetType = "UNKNOWN";
		var targetSprite = spr_icon_unknown;
		var targetIndex = 0;
		var targetHp = 0;
		if (instance_exists(currentTarget)) {
			// target crosshair
			draw_sprite_ext(
				spr_hud_target, 0,
				(currentTarget.x - camera_get_view_x(view_camera[0])) / scale,
				(currentTarget.y - camera_get_view_y(view_camera[0])) / scale,
				1.0, 1.0, 0, c_white, 0.5
			);
			
			switch (currentTarget.object_index) {
				case obj_ship_neutral: targetType = "SHIP"; targetSprite = spr_icon_ships; targetIndex = currentTarget.skinImage; break;
				case obj_asteroid: targetType = "ASTEROID"; targetSprite = spr_icon_asteroid; targetIndex = 0; break;
			}
			targetHp = currentTarget.hp;
		}
		draw_sprite_ext(targetSprite, targetIndex, hudX + 48, hudY + 56, 2.0, 2.0, 0, c_white, 0.5);
		drawText(hudX + 64, hudY + 48, "TARGET: " + targetType, 1, c_white, 0.5);
		drawText(hudX + 64, hudY + 56, "HP: " + string(targetHp), 1, c_white, 0.5);
	}
	//// message
	if (message != "") {
		drawText(hudX + 512, hudY + 48, message, 1, c_white, 0.5);
	}
	//// minimap
	drawText(hudX + 544, hudY + 249, obj_ctrl_sector.sectorName, 1, c_white, 0.5);
	surface_set_target(minimap);
	draw_clear(c_black);
	var mms = mmScale;
	with (obj_ship_player) {draw_sprite(spr_minimap_player, 0, x / mms, y / mms);}
	with (obj_ship_neutral) {draw_sprite(spr_minimap_enemy, 0, x / mms, y / mms);}
	with (obj_asteroid) {draw_point_color(x / mms, y / mms, c_white);}
	with (obj_mineral) {draw_sprite(spr_minimap_mineral, 0, x / mms, y / mms);}
	with (obj_dock) {draw_sprite(spr_minimap_dock, 0, x / mms, y / mms);}
	surface_reset_target();
	var left = min(max(0, (obj_ship_player.x / mms) - 48), (room_width / mms) - 96);
	var top = min(max(0, (obj_ship_player.y / mms) - 32), (room_height / mms) - 64);
	draw_surface_part_ext(minimap, left, top, 96, 64, hudX + 544, hudY + 256, 1.0, 1.0, c_white, 0.5);

	//// warp menu
	if (state == hudState.warpMenu) {
		var mapCenterX = hudX + 340;
		var mapCenterY = hudY + 192;
		drawText(192, 64, "GALAXY MAP", 1, c_white, 0.5);
		draw_sprite_ext(spr_hud_warp_menu, 0, mapCenterX, mapCenterY, 1.0, 1.0, 0, c_white, 0.2);
		for (var i = 0; i < ds_list_size(global.sectors); i++) {
			var sector = global.sectors[|i];
			var sectorMapX = mapCenterX + sector[? "mapX"];
			var sectorMapY = mapCenterY + sector[? "mapY"];
			var alpha = warpSelectedSector == i ? 1 : 0.5;
			draw_sprite_ext(spr_hud_warp_select, warpSelectedSector == i ? 1 : 0, sectorMapX, sectorMapY, 1.0, 1.0, 0, c_white, alpha);
			drawText(sectorMapX - 16, sectorMapY - 16, sector[? "name"], 1, c_white, alpha);
		}
	}
}