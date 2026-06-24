extends Node2D

const FuelSpin = preload("res://scenes/slot_machine.tscn")

func _on_slot_machine_button_pressed() -> void:
	if GameMaker.level_fuel <= 0:
		open_fuel_spin()
	else:
		print("you have fuel")

func open_fuel_spin():
	var fuel_spin_instance = FuelSpin.instantiate()
	$UI.add_child(fuel_spin_instance)
