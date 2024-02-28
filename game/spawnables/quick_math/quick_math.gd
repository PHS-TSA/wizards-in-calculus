class_name QuickMath
extends StaticBody2D

signal teleported(position: Vector2)

@export var answer: int
@export var question: String = "N/A"

@onready var quick_math_label: Label = %QuickMathLabel
@onready var quick_math_sprite: Sprite2D = %QuickMathSprite
@onready var teleport_position: Marker2D = %TeleportPosition


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.quick_math_label.text = self.question
	self.quick_math_sprite.texture = load("res://assets/sprites/number_balls/%s.png" % self.answer)
	self.add_to_group("quick_maths")


func teleport(value: int) -> void:
	self.teleported.emit(self.teleport_position.global_position, value == self.answer)
