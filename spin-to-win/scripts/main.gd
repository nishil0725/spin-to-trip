extends Node2D

func _on_slot_machine_button_pressed() -> void:
	if GameMaker.level_fuel == 0:
		call_deferred("change_to_slotmachine")
	else:
		print("you have fuel")

func change_to_slotmachine():
	get_tree().change_scene_to_file("res://scenes/slot_machine.tscn")
