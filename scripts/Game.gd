extends Node2D

var personaje
var pantallas
var esencia_sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SIN_ESENCIA: int = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	personaje = $Personaje
	pantallas = [$Pantalla1, $Pantalla2, $Pantalla3]
	esencia_sprite = $Esencia

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event.is_action_released('ui_accept'):
		var esencia = personaje.get_esencia()
		# qué pantalla estamos, para que nos dé su esencia
		var pantalla = personaje.get_pantalla()
		if esencia == SIN_ESENCIA: # obtiene una esencia
			var esencia_de_la_pantalla_actual = pantallas[pantalla].get_esencia()
			personaje.set_esencia(esencia_de_la_pantalla_actual)
			esencia_sprite.set_esencia_texture(esencia_de_la_pantalla_actual)
		else :
			var result = pantallas[pantalla].give_esencia(esencia) 
			print(result)
			personaje.set_esencia(SIN_ESENCIA)
			esencia_sprite.set_esencia_texture(SIN_ESENCIA)
