extends Node2D

export var id = 0
export var level = 0
const MAX_LEVEL:int = 4

var SpriteManager = load("res://scripts/Utils/SpriteManager.gd")
var RelationshipManager = load("res://scripts/Utils/RelationshipManager.gd")
var screen

func _ready():
	screen = get_node("PantallaActual")
	var texture = load(SpriteManager.get_screen_texture(id,level))
	screen.set_texture(texture)
	pass

func get_esencia():
	return id

func give_esencia(essence_id):
	print(id, level)
	if MAX_LEVEL == level or !RelationshipManager.is_the_next_essence(id, level, essence_id):
		return false
	level += 1
	var texture = load(SpriteManager.get_screen_texture(id,level))
	screen.set_texture(texture)
	return true

func has_max_level():
	return MAX_LEVEL == level
