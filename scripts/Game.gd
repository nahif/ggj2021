extends Node2D

var personaje
var pantallas
var luces
var esencia_sprite
var audioPlayer

var winning_screen_count = 0

var is_finish = false

const SIN_ESENCIA: int = -1
export var winning_time = 4

func _ready():
	personaje = $Personaje
	pantallas = [$Pantalla1, $Pantalla2, $Pantalla3]
	luces = [$Luces/Luces1, $Luces/Luces2, $Luces/Luces3]
	esencia_sprite = $Esencia
	audioPlayer = $AudioPlayer
	personaje.connect("movement", self, "_on_player_movement")
	$Musica.play()


func _input(event):
	if event.is_action_released('ui_accept') and !is_finish:
		var esencia = personaje.get_esencia()
		# qué pantalla estamos, para que nos dé su esencia
		var pantalla = personaje.get_pantalla()
		if esencia == SIN_ESENCIA: # obtiene una esencia
			var esencia_de_la_pantalla_actual = pantallas[pantalla].get_esencia()
			personaje.set_esencia(esencia_de_la_pantalla_actual)
			esencia_sprite.set_esencia_texture(esencia_de_la_pantalla_actual)
			audioPlayer.play_recieve()
		else :
			var result = pantallas[pantalla].give_esencia(esencia)
			personaje.set_esencia(SIN_ESENCIA)
			esencia_sprite.set_esencia_texture(SIN_ESENCIA)
			if result:
				audioPlayer.play_send()
				luces[pantalla].next_level()
			else:
				audioPlayer.play_error()
		review_max_screen_level()

func review_max_screen_level():
	var cant_max = 0
	for pantalla in pantallas:
		if pantalla.has_max_level():
			cant_max += 1
	if winning_screen_count < cant_max:
		audioPlayer.play_winning()
		winning_screen_count = cant_max
	if cant_max == pantallas.size():
		$Timer.connect("timeout", self, "_go_to_victory")
		$Timer.set_wait_time(winning_time)
		$Timer.start()
		is_finish = true

func _on_player_movement():
	audioPlayer.play_move()

func _go_to_victory():
	get_tree().change_scene("res://GameCompletedScreen.tscn")
