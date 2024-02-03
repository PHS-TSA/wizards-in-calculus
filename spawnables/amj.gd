extends Area2D


func _on_body_exited(_body: Node) -> void:
	get_parent().get_node("CharacterBody2D").jucies -= 5
	get_parent().get_node("CharacterBody2D/Camera2D/Juice").text = (
		"Jucies: %s" % get_parent().get_node("CharacterBody2D").jucies
	)
	get_parent().get_node("CharacterBody2D").position = (
		get_parent().get_node("Spawn").global_position
	)
