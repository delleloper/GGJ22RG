extends Area2D

export var enabled = true

func _on_pinchos_body_entered(body):
	if body is Player && enabled:
			body.hit()
