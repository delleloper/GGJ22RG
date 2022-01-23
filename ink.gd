extends Node2D

var inkLevel = 100
var maxLevel = 8

func _process(delta):
#	inkLevel+=1
	var frame = round(inkLevel % maxLevel)
	$TintaMonedas.frame = frame
	print(frame)
