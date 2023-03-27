extends Node

@export
var player_id: Game.Player

@onready
var player_label: Label = $player

@onready
var value_label: Label = $value


func _ready() -> void:
	Game.score_updated.connect(_on_score_updated)
	player_label.text = str(player_id + 1) + 'P'


func _on_score_updated(id: Game.Player, score: int) -> void:
	if player_id == id:
		value_label.text = str(score).pad_zeros(2)
