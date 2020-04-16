var sector = global.sectors[|global.currentMapIndex];

sectorName = sector[? "name"];

// set room size
room_width = sector[? "roomWidth"];
room_height = sector[? "roomHeight"];

// create docks
var docks = sector[? "docks"];
for (var i = 0; i < ds_list_size(docks); i++) {
	var dock = docks[|i];
	with (instance_create_layer(dock[? "posX"], dock[? "posY"], "bg_objs", obj_dock)) {
		name = dock[? "name"];
		spriteName = asset_get_index(dock[? "spriteName"]);
		spriteIndex = dock[? "spriteIndex"];
	}
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