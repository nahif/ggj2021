extends Sprite

export var velocity = 300
var _target

func _ready():
	set_process(false)
	pass

func add_target(target):
	_target = target
	set_process(true)

func _process(delta):
	var direction = Vector2(_target.x - position.x, _target.y - position.y);
	position = position + direction.normalized() * velocity * delta
	if direction.length() < 10:
		set_process(false)
	