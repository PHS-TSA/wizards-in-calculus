extends GutTest

# @warning_ignore("UNSAFE_METHOD_ACCESS", "UNTYPED_DECLARATION")
# var _sender = InputSender.new(Input)

# func after_each() -> void:
# 	@warning_ignore("UNSAFE_METHOD_ACCESS")
# 	_sender.release_all()
# 	@warning_ignore("UNSAFE_METHOD_ACCESS")
# 	_sender.clear()


func test_can_jump() -> void:
	var level_scene: PackedScene = load("res://game/levels/tutorial.tscn")
	var level: Level = add_child_autoqfree(level_scene.instantiate())
	var player: Wizard = level.get_node("Wizard")
	const GROUND = 544.0

	# mock input for jump key press
	# @warning_ignore("UNSAFE_METHOD_ACCESS")
	# _sender.action_down("jump").hold_for(0.5).wait_frames(1)
	# await (_sender.idle)
	Input.action_press("jump")
	simulate(level, 200, 0.5)

	assert_almost_eq(player.position.y - GROUND, 10.0, 5.0, "Jumps")

	simulate(level, 200, 0.5)

	assert_almost_eq(player.position.y - GROUND, 0.0, 5.0, "Falls")
	pause_before_teardown()
