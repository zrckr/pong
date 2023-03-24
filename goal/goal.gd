extends Area2D


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(_body: PhysicsBody2D) -> void:
	pass
