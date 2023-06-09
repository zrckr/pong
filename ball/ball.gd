class_name Ball
extends AnimatableBody2D

const DIRECTION_FIX := 0.125	# 8 possible directions

@export_range(0, 1000, 10, 'suffix:px/s')
var speed: float

@export_range(0, 1000, 10, 'suffix:px/s')
var max_speed: float

@export_range(0, 1000, 10, 'suffix:px/s')
var acceleration: float

var spawn_position: Vector2

var current_speed: float

var velocity: Vector2


func _ready() -> void:
	spawn_position = global_position
	reset_speed_and_position()


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	var collider = collision.get_collider() if collision else null
	
	if collider is Paddle or collider is PaddleCpu:
		_bounce_off_paddle(collider)
	elif collider:
		_bounce_off_wall(collision)


func _draw() -> void:
	draw_circle(Vector2.ZERO, 4.0, Color.WHITE)


func reset_speed_and_position() -> void:
	current_speed = speed
	position = spawn_position
	_randomize_direction()


func _bounce_off_wall(collision: KinematicCollision2D) -> void:
	velocity = velocity.bounce(collision.get_normal())


func _bounce_off_paddle(paddle: Node2D) -> void:
	var paddle_position = paddle.global_position
	var direction_to_ball = paddle_position.direction_to(global_position)
	
	var current_direction = velocity.normalized()
	var updated_direction = (direction_to_ball - current_direction).normalized()
	
	current_speed = min(current_speed + acceleration, max_speed)
	velocity = updated_direction * current_speed


func _randomize_direction() -> void:
	var random_direction = Vector2()
	
	# Exclude directions parallel to the X and Y axes
	while is_zero_approx(random_direction.x) or \
		is_zero_approx(random_direction.y):
		random_direction.x = snappedf(randf_range(-1, 1), DIRECTION_FIX)
		random_direction.y = snappedf(randf_range(-1, 1), DIRECTION_FIX)
	
	random_direction = random_direction.normalized()
	velocity = random_direction * current_speed
