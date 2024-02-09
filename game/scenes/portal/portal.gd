class_name Portal
extends Area2D

signal scene_changed(next_scene_name: String)

@export var level: int = 1


func _on_body_entered(_body: Node2D) -> void:
	scene_changed.emit("levels/tutorial" if self.level == 0 else "levels/%s" % self.level)
