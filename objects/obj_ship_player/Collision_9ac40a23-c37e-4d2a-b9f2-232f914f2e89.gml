/// @description Insert description here
// You can write your code in this editor
if (ds_list_size(global.player_cargo) < global.player_cargoCapacity) {
	ds_list_add(global.player_cargo, other.type);
	instance_destroy(other);
}