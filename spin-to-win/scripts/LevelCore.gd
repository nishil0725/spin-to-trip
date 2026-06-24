extends Node

const SAVE_FILE = "user://savefile.dat"

var level1_completed = false
var level2_completed = false
var level3_completed = false

var data = {}

func _ready() -> void:
	load_data()
	
func save_data():
	var file = FileAccess.open(SAVE_FILE,FileAccess.WRITE)
	data = {
		"level1_completed" = level1_completed,
		"level2_completed" = level2_completed,
		"level3_completed" = level3_completed,
	}
	
	file.store_var(data)
	file = null
	
func load_data():
	if not FileAccess.file_exists(SAVE_FILE):
		data = {
		"level1_completed" = false,
		"level2_completed" = false,
		"level3_completed" = false,
		}
		save_data()
		
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	data = file.get_var()
	level1_completed = data.level1_completed
	level2_completed = data.level2_completed
	level3_completed = data.level3_completed
	file = null
