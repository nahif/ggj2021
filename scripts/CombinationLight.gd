extends Light2D

signal minus_light 

export var light_velocity = 2
export var max_scale = 2.2
export var min_scale = 0

signal finish_light

var dir = 1

func _ready():
	set_process(false)
	pass

func _process(delta):
	var valor = Vector2(1,1) * light_velocity * delta * dir
	var scaletor = scale + valor
	scale = scaletor
	if scale.x >= max_scale:
		dir = -1
	if scale.x <= min_scale:
		emit_signal("finish_light")
		visible = false
		set_process(false)
	


