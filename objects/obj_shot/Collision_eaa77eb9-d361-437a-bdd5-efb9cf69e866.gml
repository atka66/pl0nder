/// @description Insert description here
// You can write your code in this editor
if (instance_exists(ownerShip) && ownerShip.object_index == obj_ship_player) {
	obj_camera.currentTarget = other;
}
other.hp -= damage;
instance_create_depth(x, y, -1, obj_asteroid_particle);
instance_destroy();