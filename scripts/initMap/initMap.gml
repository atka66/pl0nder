// #0: display name - #1: sector width - #2: sector height - #3: dock name
// #4: dock image index - #5: dock image scale - #6: dock x - #7: dock y 
// #8: player x - #9: player y
// #10: asteroidLimit - #11: maxAsteroidSize - #9: enemySpawn

var i = global.currentMapIndex;

// set room size
room_width = global.sectors[i, 1];
room_height = global.sectors[i, 2];

// create dock
with (
	instance_create_layer(global.sectors[i, 6], global.sectors[i, 7], "bg_objs", obj_dock
)) {
	dockSprite = global.sectors[i, 4];
	size = global.sectors[i, 5];
	name = global.sectors[i, 3];
}

// create player
instance_create_layer(global.sectors[i, 8], global.sectors[i, 9], "fg_objs", obj_ship_player)

// ctrl config
sectorName = global.sectors[i, 0];
asteroidLimit = global.sectors[i, 10];
maxAsteroidSize = global.sectors[i, 11];
enemySpawn = global.sectors[i, 12];