extends Node2D

export var id = 0
export var level = 0

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
	var is_the_next_essence = RelationshipManager.is_the_next_essence(id, level, essence_id)
	if is_the_next_essence:
		level += 1
		var texture = load(SpriteManager.get_screen_texture(id,level))
		screen.set_texture(texture)
	return is_the_next_essence