extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	call_deferred("lose")
	
func lose():
	get_tree().paused  = false
	get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")
