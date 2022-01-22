extends Area2D

func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body.name == "Player":
			body.contadorMonedas += 1
			get_parent().remove_child(self)
			print(body.contadorMonedas)
