extends StaticBody2D

onready var p = $pinchos
onready var v = $pinchos/Vanisher
func _ready():
	p.visible = false

func switch():
	if !p.visible:
		p.visible = true
		p.enabled = true
		v.show()
	else:
		p.enabled = false
		v.vanish()
		yield(v,"finish")
		p.visible = false
