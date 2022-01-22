extends Area2D

func _on_moneda_body_entered(body):
	if body is Player:
		body.contadorMonedas += 1
		queue_free()
