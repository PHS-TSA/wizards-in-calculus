class_name Level
extends Node2D

signal scene_changed(next_scene_name: String)

const Ball := preload("res://game/spawnables/number/number.tscn")

@onready var wizard: Wizard = %Wizard
@onready var spawn: Marker2D = %Spawn


func _on_wizard_did_fire(ball: int, direction: float, location: Vector2) -> void:
	var spawned: NumberBall = Ball.instantiate()
	spawned.num = ball
	spawned.rotation = direction
	spawned.position = location + Vector2(12, -8)
	spawned.velocity = spawned.velocity.rotated(direction)
	spawned.z_index = 20
	add_child.call_deferred(spawned)


func _on_anti_math_juice_poisoned(_amount: int) -> void:
	self.wizard.position = self.spawn.global_position


func _on_wizard_game_over() -> void:
	scene_changed.emit("menus/game_over/game_over")


func _on_portal_scene_changed(next_scene_name: String) -> void:
	scene_changed.emit(next_scene_name)
