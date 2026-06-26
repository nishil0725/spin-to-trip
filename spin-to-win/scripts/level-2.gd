extends Node2D

const FuelSpin = preload("res://scenes/slot_machine.tscn")


var fuel_spin_instance : Node = null
var spin_counter = GameMaker.level_spin_count
var min_fuel : int = 200
var min_fuel_flag := 0

func _ready() -> void:
	await get_tree().create_timer(1.5).timeout
	$UI/TitleLabel.visible = false
	GameMaker.current_level_number = 2


func _on_slot_machine_button_pressed() -> void:
	if GameMaker.level_fuel <= 0:
		open_fuel_spin()
	else:
		print("you have fuel")
		$UI/FuelCheck.visible = true
		await get_tree().create_timer(1.5).timeout
		$UI/FuelCheck.visible = false
		
func open_fuel_spin():

	fuel_spin_instance = FuelSpin.instantiate()
	$UI.add_child(fuel_spin_instance)
	fuel_spin_instance.tree_exiting.connect(_on_spin_popup_closed) 
	get_tree().paused = true #pauses everything
	
	if fuel_spin_instance != null:
		return

func _on_spin_popup_closed() -> void:
	fuel_spin_instance = null
	get_tree().paused = false
	
	spin_counter += 1
