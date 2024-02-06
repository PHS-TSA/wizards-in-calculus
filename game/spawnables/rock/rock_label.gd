extends Sprite2D

@export var question: String

@onready var label: Label = %MathLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = question
