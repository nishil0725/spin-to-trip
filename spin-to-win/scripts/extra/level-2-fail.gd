extends Node2D

const FuelSpin = preload("res://scenes/slot_machine.tscn")
const LoseScreen = preload("res://scenes/lose_screen.tscn")
var lose_screen_instance : Node = null

var fuel_spin_instance : Node = null
var spin_counter = GameMaker.level_spin_count
var min_fuel : int = 500
var min_fuel_flag := 0

func _ready() -> void:
	GameMaker.current_level_number = 2
	GameMaker.level_fuel = min_fuel
	
func _process(_delta: float) -> void:
	if GameMaker.level_fuel == 0 :
		lose_screen_instance = LoseScreen.instantiate()
		$UI.add_child(lose_screen_instance)
		get_tree().paused = true 
	

func _on_losescreen_popup_closed() -> void:
	lose_screen_instance = null
	get_tree().paused = false
	lose_screen_instance.tree_exiting.connect(_on_loss_popup_closed)

func _on_slot_machine_button_pressed() -> void:
	if GameMaker.level_fuel <= 0:
		open_fuel_spin()
	else:
		print("you have fuel")

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
	
func _on_loss_popup_closed():
	lose_screen_instance = null
	get_tree().paused = false

func _on_fuel_1_body_entered(_body: Node2D) -> void:
	open_fuel_spin()
