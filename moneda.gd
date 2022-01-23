extends Area2D

export var enabled = true
onready var animator := $AnimationPlayer
onready var vanisher = $Vanisher
#func setEnabled(value):
#	enabled = value
#	$Vanisher.vanish(value)
#	yield($Vanisher, "finish")
#	animator.play("spike")

func _on_moneda_body_entered(body):
	if body is Player:
		if enabled:
			body.coins += 1
			queue_free()
		else:
			body.hit()
			
func switch():
	enabled = !enabled
	vanisher.vanish()
	if animator.current_animation == "coin":
		animator.play("spike")
	else: 
		animator.play("coin")
	vanisher.show()
