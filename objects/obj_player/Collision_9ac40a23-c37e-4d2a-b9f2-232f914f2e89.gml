/// @description Insert description here
// You can write your code in this editor
if (ds_list_size(global.player_inventory) < cargoLimit) {
	ds_list_add(global.player_inventory, other.mineralType);
	instance_destroy(other);
}