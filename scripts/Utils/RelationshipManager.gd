extends Node

const relation1:Array = [2, 1, 1, 2]
const relation2:Array = [0, 2, 2, 0]
const relation3:Array = [0, 1, 0, 1]

const relationship_matrix:Array = [relation1, relation2, relation3]

static func is_the_next_essence(id, level, input):
	return relationship_matrix[id] [level] == input
