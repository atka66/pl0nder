var rot = rotation;
var thisShip = self;
with (
	instance_create_depth(
		x + (dsin(rotation) * argument0), 
		y + (dcos(rotation) * argument0), 
		-1, 
		obj_shot
	)
) {
	ownerShip = thisShip;
	direction = rot;
	image_angle = rot;
}