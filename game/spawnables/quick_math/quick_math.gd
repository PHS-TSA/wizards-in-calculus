class_name QuickMath
extends StaticBody2D

@export var answer: int
@export var question: String = "N/A"


# Called when the node enters the scene tree for the first time.
func _ready():
	%QuickMathLabel.text = question


func take_damage(value: int) -> void:
	if value == answer:
		print("work")
		get_parent().get_node("Wizard").position = %TeleportPosition.global_position
		get_parent().get_node("Wizard").walls = (get_parent().get_node("Wizard").max_walls)
		get_parent().get_node("Wizard").velocity.y = 0
	else:
		print("wrong")
