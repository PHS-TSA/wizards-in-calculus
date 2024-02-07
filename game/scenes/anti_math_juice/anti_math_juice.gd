extends Area2D

signal poisoned(amount: int)


func _on_body_exited(_body: Node2D) -> void:
	self.poisoned.emit(5)
