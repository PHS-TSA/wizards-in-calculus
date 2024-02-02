extends StaticBody2D

@export var answer: int
@export var question: String = "N/A"

@onready var label := %RockLabel


func _ready():
	label.question = question


func take_damage(value: int) -> void:
	if value == answer:
		queue_free()
