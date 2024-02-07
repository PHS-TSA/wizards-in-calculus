extends StaticBody2D

@export var answer: int
@export var question: String = "N/A"
@export var diffculty: int = 1

@onready var label: Sprite2D = %RockSprite
@onready var parent: Node2D = get_parent()


func _ready() -> void:
	label.question = question


func take_damage(value: int) -> void:
	if value == answer:
		queue_free()
		parent.get_node("Wizard").score += randi_range(
			(1 * (diffculty * 3)) if diffculty > 0 else 1, (6 * diffculty) if diffculty > 0 else 2
		)
	else:
		parent.get_node("Wizard").mana -= 1
