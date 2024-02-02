extends StaticBody2D

@export var answer: int
@export var question: String = "N/A"


func _ready():
	get_node("Sprite2D/Label").text = question


func take_damage(value: int) -> void:
	if value == answer:
		queue_free()
