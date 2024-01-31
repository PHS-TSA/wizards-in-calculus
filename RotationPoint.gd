extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	look_at(get_global_mouse_position())
#	if(Input.is_action_just_pressed("one")):
#		shoot(1)
#	elif(Input.is_action_just_pressed("two")):
#		shoot(2)
#
#func shoot(num):
#	print("Works")
#	match num: #case switch
#		1:
#			const NUMBERONE = preload("res://NumberOne.tscn")
#			var new_numberOne = NUMBERONE.instantiate()
#			new_numberOne.position = %FiringPoint.position
#			new_numberOne.global_rotation.lookat(get_global_mouse_position())
#			add_sibling(new_numberOne)
#		_:
#			print("error")
