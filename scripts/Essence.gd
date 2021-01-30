extends Sprite

export var velocity = 300
export var limit_distance = 20
var _target

signal target_capture

func _ready():
	set_process(false)
	pass

func add_target(target):
	_target = target
	set_process(true)

func _process(delta):
	var direction = Vector2(_target.x - position.x, _target.y - position.y);
	position = position + direction.normalized() * velocity * delta
	if direction.length() < limit_distance:
		set_process(false)
		emit_signal("target_capture")