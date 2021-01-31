extends Sprite

var SpriteManager = load("res://scripts/Utils/SpriteManager.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_esencia_texture(id):
	if id == -1:
		set_texture(SpriteManager.get_esencia_vacia() )
	else:
		set_texture(SpriteManager.get_esencia(id) )

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
