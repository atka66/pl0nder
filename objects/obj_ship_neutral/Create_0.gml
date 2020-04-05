/// @description Insert description here
// You can write your code in this editor
skinImage = irandom_range(1, sprite_get_number(spr_ships) - 1);
skinColor = irandom_range(1, array_length_1d(global.ship_colors) - 1);
alarm[0] = random_range(0.1, 2) * room_speed;