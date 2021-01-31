extends Node2D

export var waiting_time = 5

func _ready():
	$InitFx.play()
	pass

func _process(delta):
	if waiting_time < 0:
		$press_spacebar.visible = true
	else:
		waiting_time -= delta

func _input(event):
	if event.is_action_released('ui_accept') and waiting_time < 0:
		get_tree().change_scene("res://Game.tscn")
