/// @description Insert description here
// You can write your code in this editor
handleShipMovement();
if (hp < 0 && alive) {
	hp = 0;
	accel = 0;
	alive = false;
	if (irandom(3) == 0) {
		alarm[4] = room_speed * 1;
	} else {
		instance_destroy();
	}
}
if (!alive) {
	rotation += 10;
}