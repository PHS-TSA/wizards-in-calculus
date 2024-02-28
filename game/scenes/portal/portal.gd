class_name Portal
extends Area2D

@export var level: int = 1


func _on_body_entered(_body: Node2D) -> void:
	self.get_tree().change_scene_to_file.call_deferred(
		(
			"res://game/levels/tutorial.tscn"
			if self.level == 0
			else "res://game/levels/%s.tscn" % self.level
		)
	)
