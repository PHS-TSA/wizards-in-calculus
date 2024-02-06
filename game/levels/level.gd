extends Node2D

const Ball := preload("res://game/spawnables/number/number.tscn")


func _on_wizard_did_fire(ball: int, direction: float, location: Vector2) -> void:
	var spawned = Ball.instantiate()
	add_child(spawned)
	spawned.num = ball
	spawned.rotation = direction
	spawned.position = location + Vector2(12, -8)
	spawned.velocity = spawned.velocity.rotated(direction)
	spawned.z_index = 20


func _on_anti_math_juice_poisoned(_amount: int) -> void:
	%Wizard.position = %Spawn.global_position
