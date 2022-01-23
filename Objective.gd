extends KinematicBody2D

enum {
	IDLE,
	WANDER
}

var velocity = Vector2.ZERO
var state = IDLE

const ACCELERATION = 800
const MAX_SPEED = 600
const TOLERANCE = 4.0

onready var screen_size = get_viewport_rect().size
onready var start_position = global_position
onready var target_position = global_position

signal captured

func update_target_position():
	var targetLimits = 800
	var target_vector = Vector2(rand_range(-1, 1), rand_range(-1, 1)) * targetLimits
	target_position = start_position + target_vector
	target_position.y = clamp(target_vector.y, 0, 1000)
	target_position.x = wrapf(target_vector.x, 0,screen_size.x)
	
func is_at_target_position(): 
	# Stop moving when at target +/- tolerance
	return (target_position - global_position).length() < TOLERANCE

func _physics_process(delta):
	match state:
		IDLE:
			state = WANDER
			# Maybe wait for X seconds with a timer before moving on
			update_target_position()

		WANDER:
			accelerate_to_point(target_position, ACCELERATION * delta)
			if is_at_target_position():
				state = IDLE

	velocity = move_and_slide(velocity)
#	print(target_position)
	
func accelerate_to_point(point, acceleration_scalar):
	var direction = (point - global_position).normalized()
	var acceleration_vector = direction * acceleration_scalar
	accelerate(acceleration_vector)

func accelerate(acceleration_vector):
	velocity += acceleration_vector
	velocity = velocity.clamped(MAX_SPEED)


func _on_Area2D_body_entered(body):
	if body is Player:
		update_target_position()


func _on_Hitbox_body_entered(body):
	if body is Player:
		emit_signal("captured")
