extends Node2D

export var id = 0
export var level = 0
const MAX_LEVEL:int = 4

var SpriteManager = load("res://scripts/Utils/SpriteManager.gd")
var RelationshipManager = load("res://scripts/Utils/RelationshipManager.gd")
var screen

func _ready():
	screen = get_node("PantallaActual")
	screen.set_texture(SpriteManager.get_screen_texture(id,level))
	pass

func get_esencia():
	return id

func give_esencia(essence_id):
	if MAX_LEVEL == level or !RelationshipManager.is_the_next_essence(id, level, essence_id):
		return false
	level += 1
	screen.set_texture(SpriteManager.get_screen_texture(id,level))
	return true

func has_max_level():
	return MAX_LEVEL == level
