var fn = "sectors.dat";
if (!file_exists(fn)) {
	raiseError("COULD NOT FIND SECTORS.DAT");
} else {
	var content = json_decode(file_text_read_string(file_text_open_read(fn)));
	var sectors = content[? "sectors"];
	global.sectors = ds_list_create();
	for (var i = 0; i < ds_list_size(sectors); i++) {
		ds_list_add(global.sectors, sectors[| i]);
	}
}