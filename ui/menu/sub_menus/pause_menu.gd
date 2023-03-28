extends State


func _ready() -> void:
	%resume.pressed.connect(_on_resume_pressed)
	%settings.pressed.connect(_on_settings_pressed)
	%exit_menu.pressed.connect(_on_exit_pressed)


func begin(_kwargs := {}) -> void:
	%resume.grab_focus()


func _on_resume_pressed() -> void:
	Game.state = Game.GameState.STAGE


func _on_settings_pressed() -> void:
	state_machine.transition_queue(Menu.SubMenu.SETTINGS)


func _on_exit_pressed() -> void:
	state_machine.transition_to(Menu.SubMenu.MAIN)
