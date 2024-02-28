class_name Rock
extends StaticBody2D

signal hit(correct: bool, points: int)

@export var answer: int
@export var question: String = "N/A"
@export var difficulty: int = 1

@onready var label: Label = %MathLabel


func _ready() -> void:
	self.label.text = question
	self.add_to_group("rocks")


func take_damage(value: int) -> void:
	if value == self.answer:
		self.queue_free()
		self.hit.emit(
			true,
			randi_range(
				(1 * (difficulty * 3)) if difficulty > 0 else 1,
				(6 * difficulty) if difficulty > 0 else 2
			)
		)
	else:
		self.hit.emit(false, 1)
