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
		parent.get_node("Wizard/Camera/Score").text = (
			"Score: %s" % (parent.get_node("Wizard").score)
		)
	else:
		parent.get_node("Wizard").juices -= 1
		parent.get_node("Wizard/Camera/Juice").text = (
			"Juices: %s" % (parent.get_node("Wizard").juices)
		)
