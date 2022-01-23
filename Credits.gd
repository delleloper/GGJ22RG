extends Node2D

func _input(event):
	if event is InputEventMouseButton:
		get_tree().change_scene("res://Menu.tscn")
