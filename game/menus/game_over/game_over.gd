extends Node2D

signal scene_changed(next_scene_name: String)


func _on_restart_button_pressed() -> void:
	scene_changed.emit("levels/tutorial")
