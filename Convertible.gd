extends Node2D

onready var moneda = $moneda
onready var pinchos = $pinchos

func switch():
	moneda.enabled = !moneda.enabled
	pinchos.enabled = !pinchos.enabled
