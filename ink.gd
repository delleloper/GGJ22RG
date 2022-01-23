extends Node2D

var inkLevel = 100
var maxLevel = 8
var timer : Timer
var inverted = false

func _ready():
	timer = get_parent().get_node("Timer")

func _process(delta):
	if !inverted:
		inkLevel = timer.time_left * timer.wait_time
	else:
		inkLevel = 100 - timer.time_left * timer.wait_time
	print(inkLevel)
	var frame = round((inkLevel * maxLevel)/ 100)
	$TintaMonedas.frame = frame
