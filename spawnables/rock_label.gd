extends Sprite2D

@export var question: String

@onready var label = %Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = get_parent().question
