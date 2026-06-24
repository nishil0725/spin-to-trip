extends Area2D

const WinScreen = preload("res://scenes/win_screen.tscn")
var win_screen_instance : Control = null

func _on_body_entered(_body: Node2D) -> void:
	if win_screen_instance != null:
		return
		
	var level_key := "level%d_completed" %GameMaker.current_level_number
	LevelCore.set(level_key, true)
	GameMaker.level_fuel = 0

	
	win_screen_instance = WinScreen.instantiate()
	$"../UI".add_child(win_screen_instance)
	get_tree().paused = true 
	

func _on_winscreen_popup_closed() -> void:
	win_screen_instance = null
	get_tree().paused = false

	
	
	
