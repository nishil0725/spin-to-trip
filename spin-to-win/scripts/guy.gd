extends Area2D

var direction := Vector2.LEFT
var speed = randi_range(80,100)

func _process(delta: float) -> void:
	position += direction * speed * delta

func _on_body_entered(_body: Node2D) -> void:
	call_deferred("lose")
	
func lose():
	get_tree().paused  = false
	get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
