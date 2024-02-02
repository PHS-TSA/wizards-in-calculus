extends Area2D

var travelled_distance = 0

const num = 2


func _physics_process(delta: float):
	const SPEED = 300
	const RANGE = 1200

	var direction = Vector2.RIGHT.rotated(rotation)
	
	if direction.x < 0:
		$Sprite2D.flip_v = true
		$Sprite2D.flip_h = true
	
	position += direction * SPEED * delta

	travelled_distance += SPEED * delta

	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(num)
