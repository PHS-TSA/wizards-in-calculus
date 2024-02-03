extends Area2D


func _on_body_exited(_body: Node) -> void:
	get_parent().get_node("CharacterBody2D").juices -= 5
	get_parent().get_node("CharacterBody2D/Camera2D/Juice").text = (
		"Juices: %s" % get_parent().get_node("CharacterBody2D").juices
	)
	get_parent().get_node("CharacterBody2D").position = (
		get_parent().get_node("Spawn").global_position
	)
