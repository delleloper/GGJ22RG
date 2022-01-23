extends Node2D

onready var objective = $Objective
var inverted = false
var coinsCount = 0
onready var platformsPlaceHolders = $Platforms.get_children()
onready var coins = $coins.get_children()
onready var timer := $Timer



func _ready():
	objective.connect("captured",self,"win")
	randomize()
	var platforms = [preload("res://TrickPlatform.tscn") ,preload("res://Platform.tscn"),preload("res://VanishPlatform.tscn")]
	for p in platformsPlaceHolders:
		var choosen = randi() % 4
		if choosen == 3:
			p.queue_free()
		if choosen != 3:
			var plat = platforms[choosen].instance()
			p.get_child(0).queue_free()
			p.add_child(plat)
	for c in coins:
		if randf() > 0.45:
			c.queue_free()

func win():
	get_tree().reload_current_scene()

func gameOver():
	timer.start(1)
	yield(timer,"timeout")
	get_tree().reload_current_scene()


func invert():
	inverted = !inverted
	if inverted:
		$Normal.volume_db = -80
		$Inversed.volume_db = 0
	else:
		$Normal.volume_db = 0
		$Inversed.volume_db = -80
	$effect.play()
	$ink.inverted = inverted
	get_tree().call_group("convertibles", "switch")
	

func _on_Timer_timeout():
	invert()
