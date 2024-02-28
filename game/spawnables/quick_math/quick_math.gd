class_name QuickMath
extends StaticBody2D

@export var answer: int
@export var question: String = "N/A"

@onready var quick_math_label: Label = %QuickMathLabel
@onready var quick_math_sprite: Sprite2D = %QuickMathSprite
@onready var teleport_position: Marker2D = %TeleportPosition

@onready var wizard: Wizard = self.get_parent().get_node("Wizard")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.quick_math_label.text = ""
	quick_math_sprite.texture = load("res://assets/sprites/number_balls/%s.png" % self.answer)


func teleport(value: int) -> void:
	if value == answer:
		# gdlint:ignore = private-method-call
		wizard._on_quick_math_ball_teleported(self.teleport_position.global_position)
		wizard.walls = wizard.max_walls
		wizard.jump = true
		wizard.mana -= 1
	else:
		wizard.mana -= 2
