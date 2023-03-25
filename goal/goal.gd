extends Area2D

@export_enum("Player One", "Player Two")
var score_for_player: int


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: PhysicsBody2D) -> void:
	if body is Ball:
		_reset_ball_and_score(body)


func _reset_ball_and_score(ball: Ball) -> void:
	ball.reset_speed_and_position()
