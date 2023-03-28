extends State


func _ready() -> void:
	%save_back.pressed.connect(_on_save_back_pressed)


func begin(_kwargs := {}) -> void:
	%save_back.grab_focus()


func _on_save_back_pressed() -> void:
	state_machine.transition_back()
