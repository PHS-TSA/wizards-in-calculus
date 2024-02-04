extends Marker2D

@onready var firing_point: Marker2D = %FiringPoint


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("zero"):
		fire(0)
	elif Input.is_action_just_pressed("one"):
		fire(1)
	elif Input.is_action_just_pressed("two"):
		fire(2)
	elif Input.is_action_just_pressed("three"):
		fire(3)
	elif Input.is_action_just_pressed("four"):
		fire(4)
	elif Input.is_action_just_pressed("five"):
		fire(5)
	elif Input.is_action_just_pressed("six"):
		fire(6)
	elif Input.is_action_just_pressed("seven"):
		fire(7)
	elif Input.is_action_just_pressed("eight"):
		fire(8)
	elif Input.is_action_just_pressed("nine"):
		fire(9)


func fire(num: int) -> void:
	const WOWZA := preload("res://number_balls/number.tscn")
	var new_numbers := WOWZA.instantiate()
	new_numbers.position = firing_point.global_position
	new_numbers.rotation = rotation
	new_numbers.num = num
	get_parent().add_sibling(new_numbers)
