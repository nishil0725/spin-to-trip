extends CharacterBody2D

var direction : Vector2 = Vector2.RIGHT
var max_speed : int = 150
var speed : int
var pickupspeed : int = 2
var lane = 0
@onready var engine_label: Label = $"../../UI/EngineLabel"
@onready var fuel_label: Label = $"../../UI/FuelLabel"
@onready var fuel_tank: ProgressBar = $"../../UI/FuelTank"
@onready var score_label: Label = $"../../UI/ScoreLabel"
const MIN_VEL = 0
const START_POSITION : Vector2 = Vector2(-200,250)
var engine = GameMaker.EngineStatus
var travel_time:int

func _ready() -> void:
	fuel_tank.min_value = 0
	fuel_tank.max_value = GameMaker.level_max_fuel
	position = START_POSITION

# E to turn on engine -> to check if Engine is on
func EngineCheck():
	if Input.is_action_just_pressed("EngineStart"):
		engine = true
		engine_label.text = "Engine : on"
		
func change_to_fuelspin():
	get_tree().change_scene_to_file("res://scenes/slot_machine.tscn")

func _physics_process(delta: float) -> void:
	EngineCheck()
	
	if engine:
		@warning_ignore("narrowing_conversion")

		GameMaker.level_fuel -= delta * 50
		GameMaker.level_score += 2
		score_label.text = "Score : " + str(GameMaker.level_score)

		move(delta)

		if GameMaker.level_fuel <= 0:
			engine = false
			engine_label.text = "Engine : off"
			
	update_fuel_ui()

func brake(delta):
	velocity -= direction * delta * 100
	#threshold
	if velocity.x <= MIN_VEL:
		velocity.x = MIN_VEL

func move(delta):
	
	if speed < max_speed:
		speed += pickupspeed
	else:
		speed = max_speed
	
	if GameMaker.level_fuel >= 0:
		velocity = speed * direction
	else:
		GameMaker.level_fuel = 0
		brake(delta)
	move_and_slide()
	
	if Input.is_action_just_pressed("lane-up"):
		if lane < 1:
			position = position + Vector2(0,-150)
			lane+=1
			print("up")
			
	if Input.is_action_just_pressed("lane-down"):
		if lane > -1:
			position = position + Vector2(0,150)
			lane -= 1
			print("down")
	
func update_fuel_ui():
	fuel_tank.value = GameMaker.level_fuel
	fuel_label.text = "Fuel = %d" % int(GameMaker.level_fuel)
