extends Node2D

export var id = 1
var level = 0
var SpriteManager = load("res://scripts/Utils/SpriteManager.gd")

func _ready():
	$Sprite.set_texture(SpriteManager.get_luces_texture(id, 0))
	pass

func next_level():
	level += 1
	$Sprite.set_texture(SpriteManager.get_luces_texture(id, level))
