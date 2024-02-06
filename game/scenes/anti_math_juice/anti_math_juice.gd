extends Area2D

@onready var parent: Node2D = get_parent()


func _on_body_exited(_body: Node2D) -> void:
	parent.get_node("Wizard").juices -= 5
	parent.get_node("Wizard/Camera/Juice").text = (
		"Juices: %s" % get_parent().get_node("Wizard").juices
	)
	parent.get_node("Wizard").position = (parent.get_node("Spawn").global_position)
