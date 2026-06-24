extends Node2D

const FuelSpin = preload("res://scenes/slot_machine.tscn")


var fuel_spin_instance : Node = null
var spin_counter = GameMaker.level_spin_count
var min_fuel : int = 200
var min_fuel_flag := 0

func _ready() -> void:
	GameMaker.level_score = 100
	$"Tutorial/tut-label-1".visible = true
	await get_tree().create_timer(3).timeout
	$"Tutorial/tut-label-1".visible = false
	

func _on_slot_machine_button_pressed() -> void:
	if GameMaker.level_fuel <= 0:
		open_fuel_spin()
	else:
		print("you have fuel")

func open_fuel_spin():
	if min_fuel_flag == 0:
		GameMaker.level_fuel += min_fuel
		min_fuel_flag +=1

	fuel_spin_instance = FuelSpin.instantiate()
	$UI.add_child(fuel_spin_instance)
	fuel_spin_instance.tree_exiting.connect(_on_spin_popup_closed) 
	get_tree().paused = true #pauses everything
	
	if fuel_spin_instance != null:
		return
	
func _enter_tree() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_spin_popup_closed() -> void:
	fuel_spin_instance = null
	get_tree().paused = false
	
	spin_counter += 1
	if spin_counter == 1:
		$"Tutorial/tut-label-2".visible = true
		await get_tree().create_timer(5).timeout
		$"Tutorial/tut-label-2".visible = false
	else:
		pass
		
func _on_tut_body_entered(_body: Node2D) -> void:
	$"Tutorial/tut-label-3".visible = true
	await get_tree().create_timer(3).timeout
	$"Tutorial/tut-label-3".visible = false
		

func _on_tut_2_body_entered(_body: Node2D) -> void:
	$"Tutorial/tut-label-4".visible = true
	await get_tree().create_timer(3).timeout
	$"Tutorial/tut-label-4".visible = false
		
func _on_tut_3_body_entered(_body: Node2D) -> void:
	$"Tutorial/tut-label-5".visible = true
	await get_tree().create_timer(3).timeout
	$"Tutorial/tut-label-5".visible = false
