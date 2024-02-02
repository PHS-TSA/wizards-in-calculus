extends StaticBody2D

@export var answer: int = 1


# Called when the node enters the scene tree for the first time.
func take_damage(value: int) -> void:
	if value == answer:
		queue_free()
