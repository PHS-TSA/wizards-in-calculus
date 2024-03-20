class_name Checkpoint
extends Area2D

@onready var spawn: Marker2D = %Spawn


func _on_body_entered(body: Node2D) -> void:
	if body is Wizard:
		self.spawn.position = self.position
