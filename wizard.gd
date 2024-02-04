extends CharacterBody2D

const MAX_WALLS := 3

## You can guess.
@export var speed: int = 200

## Jump height, kinda.
@export var jump_velocity: float = -350.0

## How fast to go towards full speed.
@export var rampin: int = 20

## How far the whizard can jump.
@export var floaty: float = 150

## How fast the whizard should stop after they stop jumping.
@export var feather: int = 20

## Slow down, kid!
@export var friction: int = 25

@export var startjuices: int = 20

var score := 0
var times := 1.0

## Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

var walls := MAX_WALLS

@onready var juices := startjuices
@onready var wizard_sprite: Sprite2D = %WizardSprite
@onready var juices_text = $Camera2D/Juice


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
		# This basically just speeds up by rampin.
		velocity.x = move_toward(
			velocity.x, direction * speed, rampin * (1 if is_on_floor() else 2)
		)
		if direction == 1:
			wizard_sprite.flip_h = true
		elif direction == -1:
			wizard_sprite.flip_h = false
	else:
		# Slow the whizard down with friction.
		velocity.x = move_toward(velocity.x, 0, friction)

	move_and_slide()

	## Game Over!!
	if score >= 100 * times:
		times += 0.5
		juices += 1
		juices_text.text = "Juices: %s" % juices
	if juices <= 0:
		get_tree().change_scene_to_file("res://game_over/game_over.tscn")
