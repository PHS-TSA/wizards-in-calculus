class_name QuickMath
extends StaticBody2D

signal teleported(location: Vector2)

@export var answer: int
@export var question: String = "N/A"

@onready var quick_math_label: Label = %QuickMathLabel
@onready var teleport_position: Marker2D = %TeleportPosition


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.quick_math_label.text = question


func take_damage(value: int) -> void:
	if value == answer:
		teleported.emit(self.teleport_position.global_position)
