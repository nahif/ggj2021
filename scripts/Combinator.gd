extends Node2D

var selectionPoints
var spacePoints
var combinationPoint
var essences
var essencesSave
var finalResult
var index
var selector
var types
var order
var combinationLight

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
	essencesSave = [get_node("Essences/Essence1"),
					get_node("Essences/Essence2"),
					get_node("Essences/Essence3")]
	combinationPoint = get_node("CombinationPoint")
	finalResult = get_node("FinalResult")
	index = 0
	selector = get_node("Selector")
	combinationLight = get_node("CombinationLight")
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
			var essence = essences[index]
			essences.remove(index)
			index = 0
			if selectionPoints.size() > 0:
				selector.position = selectionPoints[index].position
			else:
				selector.visible = false
				essence.connect("target_capture", self, "_on_last_essence_capture_target")

func _on_last_essence_capture_target():
	for essence in essencesSave:
		essence.add_target(combinationPoint.position)
		essence.disconnect("target_capture", self, "_on_last_essence_capture_target")
		essence.connect("target_capture", self, "_on_combination_point")
		index = 0

func _on_combination_point():
	index += 1
	if index == 3:
		combinationLight.visible = true
		combinationLight.connect("finish_light", self, "_on_light_finished")
		combinationLight.set_process(true)
		for essence in essencesSave:
			essence.visible = false

func _on_light_finished():
	finalResult.visible = true