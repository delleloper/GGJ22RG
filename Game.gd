extends Node2D

onready var objective = $Objective
var inverted = false
func _ready():
	objective.connect("captured",self,"win")

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
