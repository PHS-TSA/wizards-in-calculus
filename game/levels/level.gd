extends Node2D

const Ball := preload("res://game/spawnables/number/number.tscn")


func _on_wizard_did_fire(ball: int, direction: float, location: Vector2) -> void:
	print("FIRING!")
	var spawned = Ball.instantiate()
	add_child(spawned)
	spawned.num = ball
	spawned.rotation = direction
	spawned.position = location
	spawned.velocity = spawned.velocity.rotated(direction)
