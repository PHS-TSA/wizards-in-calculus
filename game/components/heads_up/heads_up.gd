class_name HeadsUp
extends CanvasLayer

#@export var mana: int = 20:
	#set(value):
		#mana = value
		#mana_label.text = "Mana: %s" % mana
#
#@export var score: int = 0:
	#set(value):
		#score = value
		#score_label.text = "Score: %s" % score

@onready var mana_label: Label = %ManaLabel
@onready var score_label: Label = %ScoreLabel


func _ready():
	while true:
		score_label.text = "Score: %s" % Globals.score
		mana_label.text = "Mana: %s" % Globals.mana
		await get_tree().create_timer(0.5).timeout
