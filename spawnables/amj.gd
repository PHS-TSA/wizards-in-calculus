extends Area2D


func _on_body_exited(_body: Node):
	get_parent().get_node("CharacterBody2D").jucies -= 5
	get_parent().get_node("CharacterBody2D").get_node("Camera2D/Juice").text = (
		"Jucies: " + str(get_parent().get_node("CharacterBody2D").jucies)
	)
	get_parent().get_node("CharacterBody2D").position = (
		get_parent().get_node("Spawn").global_position
	)
