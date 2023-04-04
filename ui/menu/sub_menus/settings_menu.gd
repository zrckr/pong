extends State


func _ready() -> void:
	%save_back.pressed.connect(_on_save_back_pressed)
	%button.pressed.connect(_on_versus_button_pressed)
	%spin_box.value_changed.connect(_on_score_spinbox_value_changed)
	_display_versus_button_text()


func begin(_kwargs := {}) -> void:
	%save_back.grab_focus()


func _on_save_back_pressed() -> void:
	state_machine.transition_back()


func _on_versus_button_pressed() -> void:
	Game.is_player_two_cpu = not Game.is_player_two_cpu
	_display_versus_button_text()


func _on_score_spinbox_value_changed(value: float) -> void:
	Game.max_score = int(value)


func _display_versus_button_text() -> void:
	%button.text = (
		'Computer' if Game.is_player_two_cpu
		else 'Player'
	)
