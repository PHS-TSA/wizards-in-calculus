class_name Portal
extends Area2D

const TUTORIAL = "res://game/levels/tutorial.tscn"
const LEVELS = "res://game/levels/%s.tscn"

@export var level: int = 1


func _on_body_entered(body: Node2D) -> void:
	if body is Wizard:
		self.get_tree().change_scene_to_file.call_deferred(
			TUTORIAL if self.level == 0 else LEVELS % self.level
		)
