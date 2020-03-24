/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player)) {
	if (keyboard_check_pressed(ord("M"))) {
		if (!instance_exists(obj_ctrl_menu_parent)) {
			instance_create_depth(0, 0, 0, obj_ctrl_menu_galaxymap);
		} else {
			instance_destroy(obj_ctrl_menu_parent)
		}
	}
	if (instance_exists(obj_ctrl_menu_galaxymap)) {
		if (keyboard_check_pressed(vk_enter)) {
			room_goto(global.rooms[obj_ctrl_menu_galaxymap.selectedMap]);
		}
		if (keyboard_check_pressed(vk_up)) {
			if (obj_ctrl_menu_galaxymap.selectedMap > 0) {
				obj_ctrl_menu_galaxymap.selectedMap--;
			}
		}
		if (keyboard_check_pressed(vk_down)) {
			if (obj_ctrl_menu_galaxymap.selectedMap < array_length_1d(global.rooms) - 1) {
				obj_ctrl_menu_galaxymap.selectedMap++;
			}
		}
	}
	
	if (shakePwr > 0) {
		shakeOffsetX = irandom_range(-shakePwr, shakePwr);
		shakeOffsetY = irandom_range(-shakePwr, shakePwr);
		shakePwr--;
	}
} else {
	instance_destroy(obj_ctrl_menu_parent);
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