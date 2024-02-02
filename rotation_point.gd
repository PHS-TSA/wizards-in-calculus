extends Marker2D

@onready var firing_point: Node = %FiringPoint


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("one"):
		fire(1)
	elif Input.is_action_just_pressed("two"):
		fire(2)


func fire(num: int) -> void:
	match num:  # switch case
		1:
			const NUMBERONE = preload("res://number_balls/number_one.tscn")
			var new_number_one := NUMBERONE.instantiate()
			new_number_one.position = firing_point.position
			new_number_one.rotation = rotation
			add_sibling(new_number_one)
		2:
			const NUMBERTWO = preload("res://number_balls/number_two.tscn")
			var new_number_two := NUMBERTWO.instantiate()
			new_number_two.position = firing_point.position
			new_number_two.rotation = rotation
			add_sibling(new_number_two)
