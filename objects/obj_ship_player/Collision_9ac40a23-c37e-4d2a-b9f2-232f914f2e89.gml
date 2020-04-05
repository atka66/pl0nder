/// @description Insert description here
// You can write your code in this editor
if (ds_list_size(global.player_cargo) < global.upg_shipCargo[# global.player_equipped_shipCargo, 2]) {
	ds_list_add(global.player_cargo, other.type);
	instance_destroy(other);
}