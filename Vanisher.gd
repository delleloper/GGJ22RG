extends Node

var tw : Tween

signal finish

var start 
var end

func _ready():
	tw = $Tween

func vanish():
	start = Color.white
	end = Color.transparent
	animate()

func show():
	start = Color.transparent
	end =  Color.white
	animate()
	
func animate():
	tw.interpolate_property(get_parent(),"modulate", start,end,0.3,Tween.TRANS_QUAD,Tween.EASE_IN)
	tw.start()
	yield(tw,"tween_completed")
	emit_signal("finish")
	
