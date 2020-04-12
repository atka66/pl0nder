// #0: display name - #1: sector width - #2: sector height - #3: dock name
// #4: dock image index - #5: dock image scale - #6: dock x - #7: dock y 
// #8: player x - #9: player y
// #10: asteroidLimit - #11: maxAsteroidSize - #9: enemySpawn

var i = global.currentMapIndex;

var sector = global.sectors[|i];

global.currentSectorName = sector[? "sectorName"];

// set room size
room_width = sector[? "roomWidth"];
room_height = sector[? "roomHeight"];

// create dock
var dock = sector[? "dock"];
with (
	instance_create_layer(dock[? "dockX"], dock[? "dockY"], "bg_objs", obj_dock)
) {
	dockSprite = asset_get_index(dock[? "dockSprite"]);
	size = dock[? "dockImageScale"];
	name = dock[? "dockName"];
}

// create player
instance_create_layer(sector[? "playerX"], sector[? "playerY"], "fg_objs", obj_ship_player);

// ctrl config
/// spawner
var spawner = sector[? "spawner"];
//// asteroid
var spawnerAsteroid = spawner[? "asteroid"];
asteroidMaxCount = spawnerAsteroid[? "maxCount"];
asteroidMaxSize = spawnerAsteroid[? "maxSize"];
//// enemy
var spawnerEnemy = spawner[? "enemy"];
enemyMaxCount = spawnerEnemy[? "maxCount"];