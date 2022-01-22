extends KinematicBody2D

var velocity : Vector2 = Vector2.ZERO
export var runSpeed = 300 
export var jumpSpeed = 200
export var gravity = 500
var motion = 0
var run = 0

var contadorMonedas = 0

func _physics_process(_delta):
	motion = Input.get_action_strength("mRigth") -Input.get_action_strength("mLeft")
	run = Input.get_action_strength("ui_home")
	
	velocity.x = lerp(velocity.x, motion* runSpeed, 0.3)
	
	if !is_on_floor():
		velocity.y += gravity
		
	if Input.is_action_just_pressed("mUp") && is_on_floor():
		velocity.y = -jumpSpeed
		
	if run:
		runSpeed = 600
	else:
		runSpeed = 300
	
	velocity = move_and_slide(velocity,Vector2.UP)
	#print(velocity)
