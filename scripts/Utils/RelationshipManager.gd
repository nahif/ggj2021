extends Node

const relation1:Array = [1, 2, 2, 1]
const relation2:Array = [2, 0, 0, 2]
const relation3:Array = [1, 0, 1, 0]

const relationship_matrix:Array = [relation1, relation2, relation3]

static func is_the_next_essence(id, level, input):
	return relationship_matrix[id] [level] == input
