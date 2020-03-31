/// @description Insert description here
// You can write your code in this editor
if (ds_list_size(global.player_inventory) < global.player_cargoCapacity) {
	ds_list_add(global.player_inventory, other.type);
	instance_destroy(other);
}