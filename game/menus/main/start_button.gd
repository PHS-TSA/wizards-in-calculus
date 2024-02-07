class_name StartButton
extends Button


func _pressed() -> void:
	var _tree := self.get_tree().change_scene_to_file("res://game/levels/tutorial.tscn")
