/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

global.player_credit += bounty;
if (bounty > 0) {
	pushGuiMessage("BOUNTY COLLECTED: " + string(bounty) + "C", room_speed * 2);
}