extends State


func _ready() -> void:
	%play_again.pressed.connect(_on_play_again_pressed)
	%exit_menu.pressed.connect(_on_exit_menu_pressed)


func begin(_kwargs := {}) -> void:
	%play_again.grab_focus()


func _on_play_again_pressed() -> void:
	Game.state = Game.GameState.STAGE


func _on_exit_menu_pressed() -> void:
	state_machine.transition_to(Menu.SubMenu.MAIN)
