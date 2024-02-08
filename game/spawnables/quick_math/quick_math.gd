class_name QuickMath
extends StaticBody2D

@export var answer: int
@export var question: String = "N/A"

@onready var quick_math_label: Label = %QuickMathLabel
@onready var wizard: Wizard = get_parent().get_node("Wizard")
@onready var teleport_position: Marker2D = %TeleportPosition


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.quick_math_label.text = question


func take_damage(value: int) -> void:
	if value == answer:
		self.wizard.position = self.teleport_position.global_position
		self.wizard.walls = self.wizard.max_walls
		self.wizard.velocity.y = 0
