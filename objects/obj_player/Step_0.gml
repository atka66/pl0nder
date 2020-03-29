/// @description Insert description here
// You can write your code in this editor
if (alive) {
	handleShipControl();

	if (keyboard_check_pressed(ord("E"))) {
		
		if (place_meeting(x, y, obj_dock)) {
			global.currentDockName = obj_dock.name;
			room_goto(r_game_menu_trade);
		}
	}
}