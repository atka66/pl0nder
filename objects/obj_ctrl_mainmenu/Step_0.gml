/// @description Insert description here
// You can write your code in this editor
if (appear) {
	if (dim > 0) {
		dim -= 0.02;
	} else {
		dim = 0;
		if (alarm[0] < 0) {
			alarm[0] = room_speed * 3;
		}
	}
}