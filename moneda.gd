extends Area2D

func _on_moneda_body_entered(body):
	if body is Player:
		body.coins += 1
		queue_free()
