extends CharacterBody2D

var direction : Vector2 = Vector2.RIGHT
var speed : int = 150
var FUEL = GameMaker.level_fuel
const MIN_VEL = 0
var engine = GameMaker.EngineStatus

# E to turn on engine -> to check if Engine is on
func EngineCheck():
	if Input.is_action_just_pressed("EngineStart"):
		engine = true
		
func change_to_fuelspin():
	get_tree().change_scene_to_file("res://scenes/slot_machine.tscn")

func _physics_process(delta: float) -> void:
	EngineCheck()
	
	if engine:
		FUEL -= delta * 100
		move(delta)
		print(FUEL)

func brake(delta):
	velocity -= direction * delta * 100
	#threshold
	if velocity.x <= MIN_VEL:
		velocity.x = MIN_VEL

func move(delta):
	if FUEL > 0:
		velocity = speed * direction
	else:
		FUEL = 0
		brake(delta)
	move_and_slide()
