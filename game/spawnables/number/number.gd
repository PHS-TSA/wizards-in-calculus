extends Area2D

var velocity = Vector2.RIGHT
var traveled_distance := 0.0
var num: int

@onready var ball: Sprite2D = %BallSprite


func _physics_process(delta: float) -> void:
	const SPEED := 300
	const RANGE := 1200
	ball.texture = load("res://assets/sprites/number_balls/%s.png" % num)
	if velocity.x < 0:
		ball.flip_v = true
		ball.flip_h = true
	position += velocity * SPEED * delta
	traveled_distance += SPEED * delta
	if traveled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(num)
