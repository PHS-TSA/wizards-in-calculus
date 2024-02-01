extends CharacterBody2D

## You can guess.
@export var SPEED: int = 200

## Jump height, kinda.
@export var JUMP_VELOCITY = -350.0

## How fast to go towards full speed.
@export var rampin = 5

## How far the whizard can jump.
@export var floaty: float = 150

## How fast the whizard should stop after they stop jumping.
@export var feather: int = 20

## Slow down, kid!
@export var friction: int = 25

## Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * (delta/(floaty/100))

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_released("jump") and not is_on_floor() and not velocity.y > 0:
		velocity.y = move_toward(velocity.y,0,(feather+(abs(velocity.y/2))))

	var direction = Input.get_axis("left","right")
	if direction:
		if is_on_floor():
			velocity.x = move_toward(velocity.x, direction * SPEED, rampin) # This basically just speeds up by rampin.
		else:
			velocity.x = move_toward(velocity.x, direction * SPEED, rampin*2) # This basically just speeds up by rampin.
		if direction == 1:
			%WizardSprite.flip_h = true
		elif direction == -1:
			%WizardSprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, friction) # slow down with friction

	move_and_slide()

