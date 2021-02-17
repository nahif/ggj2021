extends Sprite

export var velocity = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	position.x -= delta * velocity
	if position.x <= -5400:
		position.x = position.x + 5400 
	pass
