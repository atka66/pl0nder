/// @description spawn tick
// You can write your code in this editor
if (!instance_exists(obj_ship_enemy) && irandom(enemyFreq - 1) == 0) {
	for (var i = 0; i < irandom(enemyCount); i++) {
		var spawnHor = irandom_range(0, 1) > 0;
		var randomX = spawnHor ? irandom_range(0, 1) * room_width : irandom_range(0, room_width);
		var randomY = !spawnHor ? irandom_range(0, 1) * room_height : irandom_range(0, room_height);
		var eHp = enemyHp;
		var eDmg = enemyDmg;
		with (instance_create_layer(randomX, randomY, "fg_objs", obj_ship_enemy)) {
			hp = eHp;
			bounty = eHp;
			dmg = eDmg;
		}
	}
}
if (irandom(convoyFreq - 1) == 0) {
	var spawnHor = irandom_range(0, 1) > 0;
	var randomX = spawnHor ? irandom_range(0, 1) * room_width : irandom_range(0, room_width);
	var randomY = !spawnHor ? irandom_range(0, 1) * room_height : irandom_range(0, room_height);
	with (instance_create_layer(randomX, randomY, "fg_objs", obj_ship_neutral)) {
		hp = 100;
		rotation = irandom(360);
	}
}
alarm[0] = room_speed;