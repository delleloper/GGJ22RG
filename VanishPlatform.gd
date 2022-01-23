extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func switch():
	if !$CollisionShape2D.disabled:
		$AnimationPlayer.play("vanish")
	else:
		$AnimationPlayer.play_backwards("vanish")
