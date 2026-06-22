extends Node2D

func _on_start_button_pressed() -> void:
	call_deferred("change_to_level")

func change_to_level():
	get_tree().change_scene_to_file("res://scenes/levels.tscn")

func _on_exit_button_pressed() -> void:
	pass
