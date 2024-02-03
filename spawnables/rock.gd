extends StaticBody2D

@export var answer: int
@export var question: String = "N/A"
@export var diffculty: int = 1

@onready var label := %RockSprite


func _ready() -> void:
	label.question = question


func take_damage(value: int) -> void:
	if value == answer:
		queue_free()
		get_parent().get_node("CharacterBody2D").score += randi_range(
			(1 * (diffculty * 3)) if diffculty > 0 else 1, (6 * diffculty) if diffculty > 0 else 2
		)
		get_parent().get_node("CharacterBody2D").get_node("Camera2D/Score").text = (
			"Score: %s" % (get_parent().get_node("CharacterBody2D").score)
		)
	else:
		get_parent().get_node("CharacterBody2D").jucies -= 1
		get_parent().get_node("CharacterBody2D").get_node("Camera2D/Juice").text = (
			"Jucies: %s" % (get_parent().get_node("CharacterBody2D").jucies)
		)
