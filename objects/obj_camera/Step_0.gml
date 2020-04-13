/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_ship_player)) {
	x = obj_ship_player.x + (obj_ship_player.hspeed * 30);
	y = obj_ship_player.y + (obj_ship_player.vspeed * 15);
	if (shakePwr > 0) {
		shakeOffsetX = irandom_range(-shakePwr, shakePwr);
		shakeOffsetY = irandom_range(-shakePwr, shakePwr);
		shakePwr--;
	}
	if (keyboard_check_pressed(ord("M"))) {
		if (state != hudState.warpMenu) {
			state = hudState.warpMenu;
		} else {
			state = hudState.none;
		}
	}
	if (keyboard_check_pressed(vk_up)) {
		if (state == hudState.warpMenu) {
			warpSelectedSector = (warpSelectedSector + ds_list_size(global.sectors) - 1) % ds_list_size(global.sectors);
		}
	}
	if (keyboard_check_pressed(vk_down)) {
		if (state == hudState.warpMenu) {
			warpSelectedSector = (warpSelectedSector + 1) % ds_list_size(global.sectors);
		}
	}
	
	if (keyboard_check_pressed(ord("N"))) {
		if (state == hudState.warpMenu) {
			global.currentMapIndex = warpSelectedSector;
			room_persistent = false;
			globalizeVars();
			room_restart();
		}
	}
} else {
	if (state != hudState.death) {
		state = hudState.death;
	}
}

if (state == hudState.death) {
	shakeOffsetX = irandom_range(-5, 5);
	shakeOffsetY = irandom_range(-5, 5);
	if (deathDim < 1) {
		deathDim += 0.02;
	} else {
		deathDim = 1;
		if (alarm[0] < 0) {
			alarm[0] = room_speed * 3;
		}
	}
}