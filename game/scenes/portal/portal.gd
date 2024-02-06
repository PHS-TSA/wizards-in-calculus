extends Area2D

@export var level: int = 1


func _on_body_entered(_body: Node2D) -> void:
	get_tree().call_deferred(
		"change_scene_to_file",
		"res://game/levels/tutorial.tscn" if (level == 0) else ("res://game/levels/%s.tscn" % level)
	)
