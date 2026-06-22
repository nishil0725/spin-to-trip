extends Control

@export var n_options = 5  #num of items
@export var spinners : Array[Control] #refrences to color-rect nodes -> 3
var values : Array
var tween : Tween #for animation

func spin():
	print("start")
	#calculating values
	values = []
	var spin_step = 1.0/float(n_options) #0.2
	
	var offsets = {} #{'from':(from shader) , 'to': ()}
	print(spin_step)
	for slots in spinners:
		values.append(randi_range(0,n_options - 1)) #generate random value
		print(slots)
		
		offsets[slots] = { 'from' : slots.material.get_shader_parameter('y_offset'),
		'to' : 3.0 + values[-1] * spin_step}
		print(offsets[slots])
		
	if tween : tween.kill()
	tween = get_tree().create_tween()
	tween.tween_method( func(v): 
		for slots in spinners:
			slots.material.set_shader_parameter('y_offset',lerp(offsets[slots].from,
			offsets[slots].to , v)),0.0,1.0,1.0).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(func():
		for slots in spinners.size():
			spinners[slots].material.set_shader_parameter('y_offset',values[slots] * spin_step)
	)
		

func _on_spin_button_pressed() -> void:
	spin()
