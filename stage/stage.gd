extends Node2D

@onready
var paddle_cpu: PaddleCpu = $paddle_cpu

@onready
var paddle_two: Paddle = $paddle_two


func _ready() -> void:
	Game.state_changed.connect(_on_game_state_changed)
	
	
func _on_game_state_changed(game_state: Game.GameState) -> void:
	if Game.is_player_two_cpu:
		paddle_cpu.process_mode = Node.PROCESS_MODE_INHERIT
		paddle_cpu.visible = true
		
		paddle_two.process_mode = Node.PROCESS_MODE_DISABLED
		paddle_two.visible = false
	else:
		paddle_cpu.process_mode = Node.PROCESS_MODE_DISABLED
		paddle_cpu.visible = false
		
		paddle_two.process_mode = Node.PROCESS_MODE_INHERIT
		paddle_two.visible = true
