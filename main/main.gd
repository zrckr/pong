extends Node

@onready
var menu: Menu = $menu

@onready
var hud: Control = $hud

@onready
var stage: Node2D = $stage


func _ready() -> void:
	Game.state_changed.connect(_on_game_state_changed)
	Game.player_won.connect(_on_game_player_won)
	get_tree().paused = true


func _input(event: InputEvent) -> void:
	if Game.state == Game.GameState.STAGE && Inputs.is_pause_pressed():
		Game.state = Game.GameState.MENU
		menu.menus.transition_to(Menu.SubMenu.PAUSE)


func _on_game_state_changed(game_state: Game.GameState) -> void:
	get_tree().paused = game_state == Game.GameState.MENU
	menu.visible = get_tree().paused
	hud.visible = not get_tree().paused
	stage.visible = not get_tree().paused


func _on_game_player_won(player_id: Game.Player) -> void:
	menu.menus.transition_to(Menu.SubMenu.GAME_OVER, {
		player_id = player_id
	})
