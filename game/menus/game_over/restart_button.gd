extends Button


func _pressed() -> void:
	self.get_tree().change_scene_to_file("res://game/levels/tutorial.tscn")
