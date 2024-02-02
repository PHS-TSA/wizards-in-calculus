extends StaticBody2D

@export var answer: int = 1


func take_damage(value: int) -> void:
	if value == answer:
		queue_free()
