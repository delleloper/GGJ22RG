extends Node2D

onready var objective = $Objective
var inverted = false
var coinsCount = 0
onready var platformsPlaceHolders = $Platforms.get_children()
onready var coins = $coins.get_children()


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
		if randf() > 0.5:
			c.queue_free()
func win():
	get_tree().reload_current_scene()
	pass




func invert():
	get_tree().call_group("convertibles", "switch")
	

func _input(event: InputEvent):
	if event.is_action_pressed("ui_accept"):
		invert()


func _on_Timer_timeout():
	invert()
