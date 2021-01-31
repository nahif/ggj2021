extends Sprite

export var velocity = 10
export var max_y = 610
export var min_y = 600
var direction = 1

func _ready():
	visible = false
	pass


func _process(delta):
	position.y = position.y + delta*direction*velocity
	if position.y > max_y:
		direction = -1
	elif position.y < min_y:
		direction = 1
	pass
