class_name AntiMathJuice
extends Area2D

@onready var wizard: Wizard = self.get_parent().get_node("Wizard")


func _on_body_exited(_body: Node2D) -> void:
	# gdlint:ignore = private-method-call
	wizard._on_anti_math_juice_poisoned(5)
