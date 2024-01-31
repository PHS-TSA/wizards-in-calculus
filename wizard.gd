extends CharacterBody2D


@export var SPEED: int #you can guess
@export var JUMP_VELOCITY = -400.0 #jump height kinda
@export var rampin = 20 #how fast to go towards full speed
@export var floaty: float #how far can jump
@export var feather: int #how fast stop after space let go
@export var friction: int #slow down kid

# Get the gravity from the project settings to be synced with RigidBody nodes.
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

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left","right")
	if direction:
		velocity.x = move_toward(velocity.x,direction * SPEED,rampin+(abs(velocity.x))) #basicly takes rampin adds velocity over and over again
		if direction == 1:
			%WizardSprite.flip_h = true
		elif direction == -1:
			%WizardSprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, friction) # slow down with friction
		
	move_and_slide()

