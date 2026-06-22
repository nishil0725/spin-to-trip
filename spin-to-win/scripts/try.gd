extends Node2D

@onready var slot_1: Sprite2D = $Slot1

func _process(delta: float) -> void:
	if slot_1.frame <= 4:
		slot_1.frame = 0
		print(slot_1.frame) 
	else:
		slot_1.frame += 1
		print(slot_1.frame) 
