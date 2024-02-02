extends Area2D

var travelled_distance := 0.0
var num: int


func _physics_process(delta: float) -> void:
	const SPEED := 300
	const RANGE := 1200
	var direction := Vector2.RIGHT.rotated(rotation)
	var ball = $Sprite2D
	ball.texture = load("res://number_balls/ball_sprites/" + str(num) + ".png")
	if direction.x < 0:
		ball.flip_v = true
		ball.flip_h = true
	position += direction * SPEED * delta
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(num)
