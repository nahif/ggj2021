extends Node2D

var pantalla_actual = 1
var pantallas = [0, 1, 2]
var posiciones_pantallas = []
export var esencia_actual = -1
var sprite

var wait= 0
const WAIT_TIME:float = 0.5

signal movement

var SpriteManager = load("res://scripts/Utils/SpriteManager.gd")

func _ready():
	var root = get_owner()
	posiciones_pantallas = [root.get_node("Positions/PosicionPantalla1"),
	root.get_node("Positions/PosicionPantalla2"),
	root.get_node("Positions/PosicionPantalla3")]
	sprite = get_node("Sprite")
	position = posiciones_pantallas[1].position
	set_process(true)

func _process(delta):
	if wait > 0:
		wait -= delta

func _input(event):
	if event.is_action_pressed('ui_right') and wait <= 0 and pantalla_actual != 2:
		goto_pantalla( (pantalla_actual + 1) )
		emit_signal("movement")
		wait = WAIT_TIME
	if event.is_action_pressed('ui_left') and wait <= 0 and pantalla_actual != 0:
		goto_pantalla( (pantalla_actual - 1) )
		wait = WAIT_TIME
		emit_signal("movement")

func goto_pantalla(index):
	position = posiciones_pantallas[index].position
	pantalla_actual = index
	sprite.set_texture(SpriteManager.get_prota(pantalla_actual))
	
func get_esencia():
	return esencia_actual
	
func set_esencia(esencia):
	esencia_actual = esencia
	
func get_pantalla():
	return pantalla_actual
