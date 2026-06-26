extends Node2D

#level-buttons
@onready var button: Button = $UI/ButtonContainer/Button
@onready var button_2: Button = $UI/ButtonContainer/Button2
@onready var button_3: Button = $UI/ButtonContainer/Button3

#unfinished level
@onready var unfinished_1: ColorRect = $UI/UnfinishedContainer/MarginContainer/ColorRect
@onready var unfinished_2: ColorRect = $UI/UnfinishedContainer/MarginContainer2/ColorRect
@onready var unfinished_3: ColorRect = $UI/UnfinishedContainer/MarginContainer3/ColorRect

@onready var label_2: Label = $UI/Label2
@export var show_duration : float = 3.0

func _ready() -> void:
	button.grab_focus()
	check_level()
	
func check_level():
	unfinished_1.visible = false

	if LevelCore.level1_completed == true:
		unfinished_2.visible = false
	else:
		unfinished_2.visible = true 
		
	if LevelCore.level2_completed == true:
		unfinished_3.visible = false
	else:
		unfinished_3.visible = true 

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level-1.tscn")

func _on_button_2_pressed() -> void:
	if LevelCore.level1_completed == true:
		get_tree().change_scene_to_file("res://scenes/level-2.tscn")
	else:
		label_2.visible = true
		await get_tree().create_timer(show_duration).timeout
		label_2.visible = false

func _on_button_3_pressed() -> void:
	if LevelCore.level2_completed == true:
		get_tree().change_scene_to_file("res://scenes/level-3.tscn")
	else:
		label_2.visible = true
		await get_tree().create_timer(show_duration).timeout
		label_2.visible = false


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
