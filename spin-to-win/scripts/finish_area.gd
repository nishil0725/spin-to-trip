extends Area2D

const WinScreen = preload("res://scenes/win_screen.tscn")
var win_screen_instance : Control = null

func _on_body_entered(_body: Node2D) -> void:
	if win_screen_instance != null:
		return
	
	match(GameMaker.current_level_number):
		1: LevelCore.level1_completed = true
		2: LevelCore.level2_completed = true
		3: LevelCore.level3_completed = true

	win_screen_instance = WinScreen.instantiate()
	get_tree().current_scene.get_node("UI").add_child(win_screen_instance)
	get_tree().paused = true


func _on_winscreen_popup_closed() -> void:
	win_screen_instance = null
	GameMaker.level_fuel = 0
	get_tree().paused = false
	
