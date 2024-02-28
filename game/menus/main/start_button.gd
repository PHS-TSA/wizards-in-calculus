class_name StartButton
extends Button


func _pressed() -> void:
	self.get_tree().change_scene_to_file.call_deferred("res://game/levels/tutorial.tscn")
