extends Node

var tw : Tween

func vanish(value):
	var start 
	var end
	tw = $Tween 
	if value:
		start = Color.white
		end = Color.transparent
	else:
		start = Color.transparent
		end =  Color.white
	
	tw.interpolate_property(get_parent(),"modulate", start,end,0.5,Tween.TRANS_QUAD,Tween.EASE_IN)
	tw.start()
