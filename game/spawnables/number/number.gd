class_name NumberBall
extends Area2D

var velocity := Vector2.RIGHT
var traveled_distance := 0.0
var num: int

@onready var ball: Sprite2D = %BallSprite


func _physics_process(delta: float) -> void:
	const SPEED := 300
	const RANGE := 1200
	self.ball.texture = load("res://assets/sprites/number_balls/%s.png" % self.num)
	if self.velocity.x < 0:
		self.ball.flip_v = true
		self.ball.flip_h = true
	self.position += self.velocity * SPEED * delta
	self.traveled_distance += SPEED * delta
	if self.traveled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body is Rock:
		var rock: Rock = body  # GDScript doesn't have flow typing.
		rock.take_damage(num)
	elif body is QuickMath:
		var teleporter: QuickMath = body
		teleporter.take_damage(num)
