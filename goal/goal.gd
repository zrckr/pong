extends Area2D

@export
var opposite_player: Game.Player


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: PhysicsBody2D) -> void:
	if body is Ball:
		_reset_ball_and_score(body)


func _reset_ball_and_score(ball: Ball) -> void:
	Game.increase_score_for(opposite_player)
	ball.reset_speed_and_position()
