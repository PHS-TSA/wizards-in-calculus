class_name AntiMathJuice
extends Area2D

signal poisoned(amount: int)


func _ready() -> void:
	self.add_to_group("anti_math_juices")


func _on_body_exited(_body: Node2D) -> void:

	if _body.name == "Wizard":
	# gdlint:ignore = private-method-call
		wizard._on_anti_math_juice_poisoned(5)
		if self.name == "RisingAntiMathJuice":
			%RisingAntiMathJuice.position.x = 795
			%RisingAntiMathJuice.position.y = -702

	
