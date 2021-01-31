extends Node

var moveAudioPlayer
var recieveAudioPlayer
var sendAudioPlayer
var errorAudioPlayer
var win
var camera

func _ready():
	moveAudioPlayer = $Movimiento
	recieveAudioPlayer = $Recoger
	sendAudioPlayer = $Entregar
	errorAudioPlayer = $Error
	win = $Winning
	camera = $Camera

func play_move():
	moveAudioPlayer.play()

func play_recieve():
	recieveAudioPlayer.play()

func play_send():
	sendAudioPlayer.play()

func play_error():
	errorAudioPlayer.play()

func play_winning():
	win.play()

func play_camera():
	camera.play()
