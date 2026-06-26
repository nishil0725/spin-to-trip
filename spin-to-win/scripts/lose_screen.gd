extends Control

func _enter_tree() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_replay_level_button_pressed() -> void:
	get_tree().paused = false
	var level_num = GameMaker.current_level_number
	get_tree().change_scene_to_file("res://scenes/level-%d.tscn" % level_num)
