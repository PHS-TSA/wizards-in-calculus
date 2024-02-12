class_name Rock
extends StaticBody2D

@export var answer: int
@export var question: String = "N/A"
@export var difficulty: int = 1

@onready var label: Label = %MathLabel

@onready var wizard: Wizard = self.get_parent().get_node("Wizard")


func _ready() -> void:
	self.label.text = question


func take_damage(value: int) -> void:
	if value == answer:
		queue_free()
		# gdlint:ignore = private-method-call
		wizard._on_rock_hit(
			randi_range(
				(1 * (difficulty * 3)) if difficulty > 0 else 1,
				(6 * difficulty) if difficulty > 0 else 2
			)
		)
	else:
		# gdlint:ignore = private-method-call
		wizard._on_rock_hit(-1)
