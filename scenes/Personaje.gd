extends Node2D

var pantalla_actual = 0
var pantallas = [0, 1, 2]
var posiciones_pantallas = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_owner()
	posiciones_pantallas = [root.get_node("Positions/PosicionPantalla1"),
	root.get_node("Positions/PosicionPantalla2"),
	root.get_node("Positions/PosicionPantalla3")]
	position = posiciones_pantallas[1].position

func goto_pantalla(index):
	position = posiciones_pantallas[index].position
	pantalla_actual = index
	#$Planet2sfx.stop()
	#$Planet1sfx.stop()
	#$Planet0sfx.play()
	
func _input(event):
	if event.is_action_released('ui_right') and pantalla_actual != 2:
		goto_pantalla( (pantalla_actual + 1) )
			
	if event.is_action_released('ui_left')  and pantalla_actual != 0:
		goto_pantalla( (pantalla_actual - 1) )
