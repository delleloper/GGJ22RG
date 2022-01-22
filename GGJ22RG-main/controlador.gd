extends Area2D

var contador = 0
var col = 0.0;

func _physics_process(_delta):
	contador += 1;

	if (contador == 180):
		if(col == -1.0):
			contador = 0
			col = 0.0
		else:
			contador = 0
			col = -1.0
	
	print(contador)
	$ColorRect.material.set_shader_param("colorAfectar",col)
