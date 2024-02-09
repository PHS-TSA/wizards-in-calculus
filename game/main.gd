extends Node2D

var next_scene: Node2D
@onready var current_scene: Node2D = $Level
@onready var animator: AnimationPlayer = %AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# This should crash if it doesn't work.
	# Eventually, we should make a trait, but those won't be available for a while.
	@warning_ignore("UNSAFE_PROPERTY_ACCESS", "UNSAFE_CAST")
	var _status := (current_scene.scene_changed as Signal).connect(_on_scene_changed)


func _on_scene_changed(next_scene_name: String) -> void:
	var Next: PackedScene = load("res://game/%s.tscn" % next_scene_name)
	next_scene = Next.instantiate()
	next_scene.z_index = -1000
	add_child.call_deferred(next_scene)
	animator.play("fade_in")
	var _status := next_scene.connect("scene_changed", _on_scene_changed)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"fade_in":
			current_scene.queue_free()
			current_scene = next_scene
			current_scene.z_index = 0
			next_scene = null
			animator.play("fade_out")
