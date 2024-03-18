class_name Checkpoint
extends Area2D

@onready var spawn: Marker2D = %Spawn


func _on_body_entered(_body: Node2D) -> void:
	if _body.name == "Wizard":
		self.spawn.position = position

