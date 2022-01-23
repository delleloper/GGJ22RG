extends Node2D

func _on_BtnJugar_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_BtnSonidos_pressed():
	AudioServer.set_bus_mute(0, AudioServer.is_bus_mute(0))
