extends Node

signal state_changed(state)

signal score_updated(player_id, score)

signal player_won(player_id)

enum GameState {
	MENU,
	STAGE,
}

enum Player {
	ONE,
	TWO
}

var max_score := 10
var is_player_two_cpu := true

var state: GameState:
	get: return _state
	set(value):
		assert(value != _state, 'The state is already set')
		_state = value
		state_changed.emit(value)

var _scores = {
	Player.ONE: -1,
	Player.TWO: -1,
}

var _state: GameState


func begin_game() -> void:
	state = GameState.STAGE
	randomize()
	
	for player_id in _scores:
		_scores[player_id] = 0
		score_updated.emit(player_id, 0)


func increase_score_for(player_id: Player) -> void:
	assert(state == GameState.STAGE, 'Game has not begun')
	
	_scores[player_id] += 1
	score_updated.emit(player_id, _scores[player_id])
	
	_try_end_game(player_id)


func _try_end_game(player_id: Player) -> void:
	if _scores[player_id] == max_score:
		state = GameState.MENU
		player_won.emit(player_id)
