extends Node2D

onready var objective = $Objective

func _ready():
	objective.connect("captured",self,"win")

func win():
	get_tree().reload_current_scene()
	pass
