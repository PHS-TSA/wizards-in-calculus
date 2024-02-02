extends Sprite2D

@export var question: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = get_parent().question
