extends Node

var moveAudioPlayer
var recieveAudioPlayer
var sendAudioPlayer
var errorAudioPlayer

func _ready():
	moveAudioPlayer = $Movimiento
	recieveAudioPlayer = $Recoger
	sendAudioPlayer = $Entregar
	errorAudioPlayer = $Error
	pass # Replace with function body.

func play_move():
	moveAudioPlayer.play()

func play_recieve():
	recieveAudioPlayer.play()

func play_send():
	sendAudioPlayer.play()

func play_error():
	errorAudioPlayer.play()