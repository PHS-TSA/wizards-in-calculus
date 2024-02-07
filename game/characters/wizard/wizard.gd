class_name Wizard
extends CharacterBody2D

signal score_updated(value: int)

signal mana_updated(value: int)

signal did_fire(ball: int, direction: float, location: Vector2)

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

var walls := max_walls

@onready var wizard_sprite: Sprite2D = %WizardSprite

static var max_walls := 3


func _process(_delta: float) -> void:
	firing()
	if self.score >= 100 * self.times:  # Game Over!!
		self.times += 0.5
		self.mana += 1
	if self.mana <= 0:
		var _new_tree := self.get_tree().change_scene_to_file(
			"res://game/menus/game_over/game_over.tscn"
		)


func _physics_process(delta: float) -> void:
	# Add gravity.
	if not self.is_on_floor():
		self.velocity.y += self.gravity * (delta / (self.floaty / 100))

	# Handle jumping.
	if Input.is_action_just_pressed("jump") and self.is_on_floor():
		velocity.y = jump_velocity
	if Input.is_action_just_pressed("jump") and self.is_on_wall_only() and self.walls > 0:
		self.velocity.y = self.jump_velocity
		self.velocity.x = -400 if self.wizard_sprite.flip_h else 400
		self.walls -= 1
	if Input.is_action_just_released("jump") and not self.is_on_floor() and not self.velocity.y > 0:
		self.velocity.y = move_toward(self.velocity.y, 0, self.feather + absf(self.velocity.y / 2))

	if is_on_floor():
		self.walls = max_walls

	var direction := Input.get_axis("left", "right")
	if direction:
		# This basically just speeds up by ramping.
		self.velocity.x = move_toward(
			self.velocity.x, direction * self.speed, self.ramping * (1 if self.is_on_floor() else 2)
		)
		if direction == 1:
			wizard_sprite.flip_h = true
		elif direction == -1:
			self.wizard_sprite.flip_h = false
	else:
		# Slow the wizard down with friction.
		self.velocity.x = move_toward(velocity.x, 0, friction)

	var _collided := self.move_and_slide()


func firing() -> void:
	if Input.is_action_just_pressed("zero"):
		self.fire(0)
	elif Input.is_action_just_pressed("one"):
		self.fire(1)
	elif Input.is_action_just_pressed("two"):
		self.fire(2)
	elif Input.is_action_just_pressed("three"):
		self.fire(3)
	elif Input.is_action_just_pressed("four"):
		self.fire(4)
	elif Input.is_action_just_pressed("five"):
		self.fire(5)
	elif Input.is_action_just_pressed("six"):
		self.fire(6)
	elif Input.is_action_just_pressed("seven"):
		self.fire(7)
	elif Input.is_action_just_pressed("eight"):
		self.fire(8)
	elif Input.is_action_just_pressed("nine"):
		self.fire(9)


func fire(num: int) -> void:
	var angle := self.global_position.angle_to_point(get_global_mouse_position())
	self.did_fire.emit(num, angle, self.global_position)


func _on_rock_hit(points: int) -> void:
	if points > 0:
		self.score += points
	else:
		self.mana += points


func _on_anti_math_juice_poisoned(amount: int) -> void:
	self.mana -= amount
