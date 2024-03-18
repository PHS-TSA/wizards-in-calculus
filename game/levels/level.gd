class_name Level
extends Node2D

const Ball := preload("res://game/spawnables/number/number.tscn")

@onready var wizard: Wizard = %Wizard
@onready var spawn: Marker2D = %Spawn


func _on_wizard_did_fire(ball: int, direction: float, location: Vector2) -> void:
	var spawned: NumberBall = Ball.instantiate()
	add_child(spawned)
	spawned.num = ball
	spawned.rotation = direction
	spawned.position = location + Vector2(12, -8)
	spawned.velocity = spawned.velocity.rotated(direction)
	spawned.z_index = 20


func _on_anti_math_juice_poisoned(_amount: int) -> void:
	self.wizard.position = self.spawn.global_position

#Starts lava
func _on_area_2d_body_exited(body):
	var starting_mana = get_node("Wizard").mana
	%RisingAntiMathJuice.position.x = 795
	%RisingAntiMathJuice.position.y = -702
	while get_node("Wizard").mana == starting_mana:
		%RisingAntiMathJuice.position.y += -5
		await get_tree().create_timer(0.1).timeout
		
	pass # Replace with function body.
