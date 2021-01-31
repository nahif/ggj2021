extends Node2D

var light
var velocity = 1.3
var audio

# Called when the node enters the scene tree for the first time.
func _ready():
	light = $Luz
	audio = $AudioPlayer
	audio.play_camera()
	pass # Replace with function body.

func _process(delta):
	if light.energy > 0:
		light.energy -= delta * velocity
