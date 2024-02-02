extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("one"):
		shoot(1)
	elif Input.is_action_just_pressed("two"):
		shoot(2)


func shoot(num):
	match num:  # switch case
		1:
			const NUMBERONE = preload("res://number_balls/number_one.tscn")
			var new_number_one = NUMBERONE.instantiate()
			new_number_one.position = %FiringPoint.position
			new_number_one.rotation = rotation
			add_sibling(new_number_one)
		2:
			const NUMBERTWO = preload("res://number_balls/number_two.tscn")
			var new_number_two = NUMBERTWO.instantiate()
			new_number_two.position = %FiringPoint.position
			new_number_two.rotation = rotation
			add_sibling(new_number_two)
		_:
			pass
