extends Area2D

export var enabled = true setget setEnabled

func setEnabled(value):
	enabled = value
	$Vanisher.vanish(value)

func _on_moneda_body_entered(body):
	if body is Player && enabled:
		body.coins += 1
		queue_free()
