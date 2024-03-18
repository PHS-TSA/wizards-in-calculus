class_name QuickMath
extends StaticBody2D

signal teleported(position: Vector2)

@export var answer: int
@export var question: String = "N/A"

@onready var quick_math_label: Label = %QuickMathLabel
@onready var quick_math_sprite: Sprite2D = %QuickMathSprite
@onready var teleport_position: Marker2D = %TeleportPosition


# Called when the node enters the scene tree for the first time.

#generate random num


func _ready() -> void:

	#var num: int = randi() % 9
	self.quick_math_label.text = question
	quick_math_sprite.texture = load("res://assets/sprites/number_balls_blank/1b.png")


func teleport(value: int) -> void:
	if value == answer:
		# gdlint:ignore = private-method-call
		wizard._on_quick_math_ball_teleported(self.teleport_position.global_position)
		wizard.walls = wizard.max_walls
		wizard.jump = true
	else:
		wizard.mana -= 2
