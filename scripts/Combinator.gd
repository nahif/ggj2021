extends Node2D

var selectionPoints
var spacePoints
var essences
var index
var selector
var types
var order

signal finish(itemId)

func _ready():
	selectionPoints = [get_node("SelectionPoints/SelectionPoint1"), 
					   get_node("SelectionPoints/SelectionPoint2"), 
					   get_node("SelectionPoints/SelectionPoint3")]
	spacePoints = [get_node("Spaces/Space1"),
				   get_node("Spaces/Space2"),
				   get_node("Spaces/Space3")]
	essences = [get_node("Essences/Essence1"),
				get_node("Essences/Essence2"),
				get_node("Essences/Essence3")]
	index = 0
	selector = get_node("Selector")
	pass

func _input(event):
	if event is InputEventKey and event.pressed and selectionPoints.size() > 0:
		if event.scancode == KEY_RIGHT:
			index = (index + 1) % selectionPoints.size()
			selector.position = selectionPoints[index].position
		if event.scancode == KEY_LEFT:
			index = (index - 1) % selectionPoints.size()
			selector.position = selectionPoints[index].position
		if event.scancode == KEY_SPACE:
			essences[index].add_target(spacePoints[spacePoints.size() - selectionPoints.size()].position)
			selectionPoints.remove(index)
			essences.remove(index)
			index = 0
			if selectionPoints.size() > 0:
				selector.position = selectionPoints[index].position
			else:
				selector.visible = false