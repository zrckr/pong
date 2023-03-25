class_name Paddle
extends AnimatableBody2D

@export_enum("Player One", "Player Two")
var player_id: int

@export
var speed: float


func _physics_process(delta: float) -> void:
	var player_prefix = 'p' + str(player_id + 1)
	var player_up = player_prefix + '_up'
	var player_down = player_prefix + '_down'
	
	var direction = int(Input.get_axis(player_up, player_down))
	var motion = Vector2.DOWN * direction * speed * delta
	move_and_collide(motion)
