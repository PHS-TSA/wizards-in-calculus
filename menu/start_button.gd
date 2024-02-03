extends Button

func _pressed() -> void:
	print("Start")
	get_tree().change_scene_to_file("res://1.tscn")
