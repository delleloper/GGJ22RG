extends Area2D

export var enabled = true setget setEnabled

func setEnabled(value):
	enabled = value
	$Vanisher.vanish(value)

func _on_pinchos_body_entered(body):
	if body is Player && enabled:
			get_tree().reload_current_scene()
