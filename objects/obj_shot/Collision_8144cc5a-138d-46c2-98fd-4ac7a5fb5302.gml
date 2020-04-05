/// @description Insert description here
// You can write your code in this editor
if (other != ownerShip) {
	if (instance_exists(ownerShip) && ownerShip.object_index == obj_ship_player) {
		obj_camera.currentTarget = other;
	}
	if (other.object_index == obj_ship_player) {
		obj_camera.shakePwr += 10;
	}
	other.hp -= damage;
	instance_destroy();
}