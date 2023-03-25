extends Node

func is_select_pressed() -> bool:
	return Input.is_action_just_pressed('select')


func is_start_pressed() -> bool:
	return Input.is_action_just_pressed('start')


func get_axis(player_id: Game.Player) -> float:
	var prefix = 'p%d_' % (player_id + 1)
	return Input.get_axis(prefix + 'up', prefix + 'down')


@warning_ignore('narrowing_conversion')
func get_direction(player_id: Game.Player) -> int:
	return signf(get_axis(player_id))
