extends State


func _ready() -> void:
	%resume.pressed.connect(_on_resume_pressed)
	%settings.pressed.connect(_on_settings_pressed)
	%quit.pressed.connect(_on_quit_pressed)


func begin(_kwargs := {}) -> void:
	%resume.grab_focus()


func _on_resume_pressed() -> void:
	assert(false, 'Method not implemented')


func _on_settings_pressed() -> void:
	state_machine.transition_queue(Menu.SubMenu.SETTINGS)


func _on_quit_pressed() -> void:
	assert(false, 'Method not implemented')