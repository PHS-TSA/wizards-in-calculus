extends CanvasLayer

@export var mana: int = 20:
	set(value):
		mana = value
		mana_label.text = "Mana: %s" % mana

@export var score: int = 0:
	set(value):
		score = value
		score_label.text = "Score: %s" % score

@onready var mana_label: Label = %ManaLabel
@onready var score_label: Label = %ScoreLabel


func _on_wizard_score_updated(value: int) -> void:
	self.score = value


func _on_wizard_mana_updated(value: int) -> void:
	self.mana = value
