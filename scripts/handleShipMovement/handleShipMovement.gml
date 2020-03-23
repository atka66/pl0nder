/// @description Insert description here
// You can write your code in this editor
if (accel > 0) {
	if (speed < speedLimit) {
		var acc = (0.2 * accel);
		var newSpeed = speed + acc;
		if (newSpeed > speedLimit) {
			motion_add(rotation, speedLimit - speed);
		} else {
			motion_add(rotation, acc);
		}
	}
}
if (accel < 0) {
	if (speed > 0) {
		var newSpeed = speed + (0.5 * accel);
		if (newSpeed < 0) {
			speed = 0;
		} else {
			speed = newSpeed;
		}
	}
}