class_name Level
extends Node2D

const Ball := preload("res://game/spawnables/number/number.tscn")

const WIZARD_OFFSET := Vector2(12, -8)

@onready var wizard: Wizard = %Wizard
@onready var spawn: Marker2D = %Spawn
@onready var hud: HeadsUp = %HUD


func _ready() -> void:
	# Get the Wizard, and pass on the score_updated signal to the HUD
	var _connection_err := wizard.score_updated.connect(hud.on_wizard_score_updated)
	var _connection_err2 := wizard.mana_updated.connect(self._on_wizard_mana_updated)
	var _connection_err3 := wizard.did_fire.connect(self._on_wizard_did_fire)


func _process(_delta: float) -> void:
	# Get all nodes of type AntiMathJuice and connect to their poisoned signal
	register("anti_math_juices", "poisoned", self._on_anti_math_juice_poisoned)

	# Get all nodes of type Rock and connect to their hit signal
	register("rocks", "hit", self.wizard.on_rock_hit)

	# Get all nodes of type QuickMath and connect to their teleported signal
	register("quick_maths", "teleported", self.wizard.on_quick_math_ball_teleported)


## Get all of the nodes of a type and connect their signals
func register(group: String, sig: String, callback: Callable) -> void:
	for node in get_tree().get_nodes_in_group(group):
		if node.has_signal(sig):
			if not node.is_connected(sig, callback):
				var _connection_err := node.connect(sig, callback)


func _on_wizard_did_fire(ball: int, direction: float, location: Vector2) -> void:
	var spawned: NumberBall = Ball.instantiate()
	spawned.num = ball
	spawned.rotation = direction
	spawned.position = %Wizard.bsp.global_position
	spawned.velocity = spawned.velocity.rotated(direction)
	spawned.z_index = 20
	add_child(spawned)
	spawned.add_to_group("number_balls")


func _on_anti_math_juice_poisoned(amount: int) -> void:
	self.wizard.position = self.spawn.global_position
	wizard.on_anti_math_juice_poisoned(amount)


func _on_wizard_mana_updated(mana: int) -> void:
	if mana <= 0:
		self.get_tree().change_scene_to_file.call_deferred(
			"res://game/menus/game_over/game_over.tscn"
		)
	else:
		hud.on_wizard_mana_updated(mana)
