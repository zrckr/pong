class_name Paddle
extends AnimatableBody2D

@export
var player: Game.Player

@export_range(0, 1000, 10, 'suffix:px/s')
var speed: float


func _physics_process(delta: float) -> void:
	var player_direction = Inputs.get_axis(player)
	var motion = Vector2.DOWN * player_direction * speed * delta
	move_and_collide(motion)
