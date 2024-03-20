class_name AntiMathJuice
extends Area2D

signal poisoned(amount: int)


func _ready() -> void:
	self.add_to_group("anti_math_juices")


func _on_body_exited(_body: Node2D) -> void:
	self.poisoned.emit(5)
