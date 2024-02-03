extends Area2D


func _on_body_entered(_body: Node) -> void:
	get_parent().get_node("Spawn").position = position
