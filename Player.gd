extends KinematicBody2D

class_name Player



export var runSpeed = 100 
export var jumpSpeed = 200
export var gravity = 500

onready var sprite : Sprite = $sprite
onready var animator := $AnimationPlayer
var velocity : Vector2 = Vector2.ZERO
var motion = 0
var coins = 0


func _process(delta):
	if is_on_floor():
		if animator.current_animation == "jump":
			animator.play("land")
		else:
			if motion != 0:
				animator.play("run")
			if motion == 0:
				animator.play("idle")


func _physics_process(delta):
	motion = Input.get_action_strength("mRigth") - Input.get_action_strength("mLeft")
	velocity.x = lerp(velocity.x, motion * runSpeed,0.3)
	sprite.flip_h = velocity.x < 0
	if !is_on_floor():
		velocity.y += gravity
	if Input.is_action_just_pressed("mUp") && is_on_floor():
		velocity.y = -jumpSpeed
		animator.play("jump")
	velocity = move_and_slide(velocity,Vector2.UP)
