if (keyboard_check(ord("A"))) {
	rotation += 3;
}
if (keyboard_check(ord("D"))) {
	rotation -= 3;
}

if (keyboard_check(ord("W"))) {
	accel = 1;
} else {
	accel = 0;
}


if (keyboard_check_pressed(ord("F"))) {
	shipShoot(-8);
	shipShoot(8);
}