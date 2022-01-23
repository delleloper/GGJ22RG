extends StaticBody2D


func switch():
	if !$CollisionShape2D.disabled:
		$AnimationPlayer.play("vanish")
	else:
		$AnimationPlayer.play_backwards("vanish")
