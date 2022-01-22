extends KinematicBody2D

class_name Player

var velocity : Vector2 = Vector2.ZERO
export var runSpeed = 100 
export var jumpSpeed = 200
export var gravity = 500
var motion = 0

func _physics_process(delta):
	motion = Input.get_action_strength("mRigth") -Input.get_action_strength("mLeft")
	velocity.x = lerp(velocity.x, motion* runSpeed, 0.3)
	if !is_on_floor():
		velocity.y += gravity
	if Input.is_action_just_pressed("mUp") && is_on_floor():
		velocity.y = -jumpSpeed
	velocity = move_and_slide(velocity,Vector2.UP)
