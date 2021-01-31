extends Node

const characterA:Array = [preload("res://assets/sprites/characters/a0.png"),preload("res://assets/sprites/characters/a1.png") ,preload("res://assets/sprites/characters/a2.png" ),preload("res://assets/sprites/characters/a3.png" ),preload("res://assets/sprites/characters/a4.png") ]
const characterB:Array = [preload("res://assets/sprites/characters/b0.png"),preload("res://assets/sprites/characters/b1.png" ),preload("res://assets/sprites/characters/b2.png" ),preload("res://assets/sprites/characters/b3.png" ),preload("res://assets/sprites/characters/b4.png") ]
const characterC:Array = [preload("res://assets/sprites/characters/c0.png"),preload("res://assets/sprites/characters/c1.png" ), preload("res://assets/sprites/characters/c2.png"),preload("res://assets/sprites/characters/c3.png" ),preload("res://assets/sprites/characters/c4.png" )]

const esencias:Array = [preload("res://assets/sprites/esencias/e0.png"),preload("res://assets/sprites/esencias/e1.png" ), preload("res://assets/sprites/esencias/e2.png" )]

const esencia_vacia:Array = [preload("res://assets/sprites/esencias/empty.png")]

const prota:Array  =[preload("res://assets/sprites/prota/persEntregaIZ.png"),preload("res://assets/sprites/prota/persEntregaD.png"),preload("res://assets/sprites/prota/persEntregaD.png")]

const charactersTexture:Array = [characterA, characterB, characterC]

static func get_screen_texture(id, level):
	return charactersTexture[id][level]

static func get_esencia_vacia():
	return esencia_vacia[0]

static func get_esencia(id):
	return esencias[id]

static func get_prota(id):
	return prota[id]
