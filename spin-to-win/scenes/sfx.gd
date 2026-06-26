extends Node

@onready var sfx_player := AudioStreamPlayer.new()

var sounds = {
	"engine_on": preload("res://sfx/freesounds123-car-engine-335601.mp3"),
	"engine":preload("res://sfx/freesound_community-engine-6000.mp3")
}

func _ready() -> void:
	add_child(sfx_player)
	
func play(sound_name):
	if sounds.has(sound_name):
		sfx_player.stream = sounds[sound_name]
		sfx_player.play()
	else:
		print("sound not found")
