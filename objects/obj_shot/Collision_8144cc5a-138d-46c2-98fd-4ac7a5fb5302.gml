/// @description Insert description here
// You can write your code in this editor
if (other != ownerShip) {
	other.hp -= 15;
	if (other.object_index == obj_player) {
		obj_camera.shakePwr += 10;
	}
	instance_destroy();
}