extends Node2D

var symbols: Array = [1,2,3,4,5,6,7]
var speed := 0.1
var spinning := false
var spin := 0
var fuel = 0

#initializing slots
@onready var reel_1: VBoxContainer = $SlotMachineWindow/SlotMachineContainer/SlotsContainer/SlotsMargin/Slots/Reel1
@onready var reel_2: VBoxContainer = $SlotMachineWindow/SlotMachineContainer/SlotsContainer/SlotsMargin/Slots/Reel2
@onready var reel_3: VBoxContainer = $SlotMachineWindow/SlotMachineContainer/SlotsContainer/SlotsMargin/Slots/Reel3

@onready var score_label: Label = $SlotMachineWindow/SlotMachineContainer/Panel/ScoreLabel
@onready var spin_button: Button = $SlotMachineWindow/SlotMachineContainer/SpinButton

#duration of spin
var rotation_time := 1.2
var time_left := 0.0

func _ready() -> void:
	update_symbols()

#signal from button
func _on_spin_button_pressed() -> void:
	start_spin()
	$SlotMachineWindow/Timer.start()
	spin += 1
	
#starts the spin and adds the timer
func start_spin():
	spinning = true
	time_left = rotation_time

func stop_spin():
	spinning = false
	update_symbols()
	check_result()

#runs every frame
func _process(delta: float) -> void:
	if spinning:
		rotate_symbols(delta)
		time_left -= delta #sets remaining time
		if time_left <= 0: #timeout
			stop_spin()

func rotate_symbols(_delta):
	update_slot_sym(reel_1)
	update_slot_sym(reel_2)
	update_slot_sym(reel_3)
	
#updates all slots
func update_symbols():
	#update symbols in each reel
	update_slot_sym(reel_1)
	update_slot_sym(reel_2)
	update_slot_sym(reel_3)
	
#function to update symbols on a specific reel
func update_slot_sym(reel):
	#if reel exists update it
	if reel:
		#assigns a random value (0 - 6)
		var reel_symbol_index = randi() % symbols.size() 
		for i in range(reel.get_child_count()): # 0 1 2
			var label = reel.get_child(i)
			if label is Label:
				var symbol_index = (reel_symbol_index + 1) % symbols.size()
				label.text = str(symbols[symbol_index])
				
				
func check_result():
	var result1 = reel_1.get_child(1).text
	var result2 = reel_2.get_child(1).text
	var result3 = reel_3.get_child(1).text
	
	
	fuel = 200 + (((int(result1) + int(result2) + int(result3)) * randi_range(60,100)) - (spin * randi_range(80,150)))
	
	if fuel <= 0:
		fuel = 50
		
	if result1 == result2 and result2 == result3:
		score_label.text = str(100)
		fuel = 2000
	else:
		score_label.text = str(0)

	GameMaker.level_fuel = fuel


func _on_timer_timeout() -> void:
	queue_free()
