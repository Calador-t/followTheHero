extends Node2D


func attach_object(object: Node2D, position):
	add_child(object)
	object.global_position = position
	print("atteacked")
	
