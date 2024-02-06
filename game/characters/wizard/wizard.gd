extends CharacterBody2D

signal score_updated(value: int)

signal mana_updated(value: int)

signal did_fire(ball: int, direction: float, location: Vector2)

const MAX_WALLS := 3

## You can guess.
@export var speed: int = 200

## Jump height, kinda.
@export var jump_velocity: float = -350.0

## How fast to go towards full speed.
@export var ramping: int = 20

## How far the wizard can jump.
@export var floaty: float = 150

## How fast the wizard should stop after they stop jumping.
@export var feather: int = 20

## Slow down, kid!
@export var friction: int = 25

var score := 0:
	set(value):
		score = value
		score_updated.emit(score)

var mana := 20:
	set(value):
		mana = value
		mana_updated.emit(mana)

var times := 1.0

## Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

var walls := MAX_WALLS

@onready var wizard_sprite: Sprite2D = %WizardSprite


func _process(_delta: float) -> void:
	firing()
	if score >= 100 * times:  # Game Over!!
		times += 0.5
		mana += 1
	if mana <= 0:
		get_tree().change_scene_to_file("res://game/menus/game_over/game_over.tscn")


func _physics_process(delta: float) -> void:
	# Add  gravity.
	if not is_on_floor():
		velocity.y += gravity * (delta / (floaty / 100))

	# Handle jumping.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	if Input.is_action_just_pressed("jump") and is_on_wall_only() and walls > 0:
		velocity.y = jump_velocity
		velocity.x = -400 if wizard_sprite.flip_h else 400
		walls -= 1
	if Input.is_action_just_released("jump") and not is_on_floor() and not velocity.y > 0:
		velocity.y = move_toward(velocity.y, 0, feather + (abs(velocity.y / 2)))

	if is_on_floor():
		walls = MAX_WALLS

	var direction := Input.get_axis("left", "right")
	if direction:
		# This basically just speeds up by ramping.
		velocity.x = move_toward(
			velocity.x, direction * speed, ramping * (1 if is_on_floor() else 2)
		)
		if direction == 1:
			wizard_sprite.flip_h = true
		elif direction == -1:
			wizard_sprite.flip_h = false
	else:
		# Slow the wizard down with friction.
		velocity.x = move_toward(velocity.x, 0, friction)

	move_and_slide()


func firing():
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
	print("firing")
	did_fire.emit(num, global_position.angle_to_point(get_global_mouse_position()), global_position)
