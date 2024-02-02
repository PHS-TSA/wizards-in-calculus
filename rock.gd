extends StaticBody2D

@export var answer = 1


# Called when the node enters the scene tree for the first time.
func take_damage(value):
	if value == answer:
		queue_free()
