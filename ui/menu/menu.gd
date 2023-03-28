class_name Menu
extends Node

const SubMenu := {
	MAIN = &'main_menu',
	PAUSE = &'pause_menu',
	SETTINGS = &'settings_menu',
}

@onready
var menus: StateMachine = $state_machine

@onready
var menu_array: Array = $state_machine.get_children()


func _ready() -> void:
	menus.state_changed.connect(_on_menu_changed)
	menus.initialize_fsm(SubMenu.MAIN)


func _on_menu_changed(current_menu: State) -> void:
	for menu in menu_array:
		menu.visible = current_menu != null and current_menu.name == menu.name
