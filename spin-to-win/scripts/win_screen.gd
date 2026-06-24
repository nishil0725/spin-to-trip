extends Control
@onready var score_label: Label = $ScoreLabel

func _ready() -> void:
	score_label.text = "Score : " + str(GameMaker.level_score + 2)

func _enter_tree() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_next_level_button_pressed() -> void:
	get_tree().paused = false
	GameMaker.current_level_number += 1
	
	if GameMaker.current_level_number > GameMaker.levels:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/levels.tscn")
		
func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
