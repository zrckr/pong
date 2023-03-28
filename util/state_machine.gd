class_name StateMachine
extends Node

signal state_changed(current_state)

var state: State:
	get: return states_stack.front()

var last_state: State:
	get: return states_stack[1] if len(states_stack) > 1 else null

var states_stack: Array[State] = [null]


func _physics_process(delta: float) -> void:
	if state != null:
		state.act(delta)


func _unhandled_input(event: InputEvent) -> void:
	if state != null:
		state.input(event)


func initialize_fsm(state_path: String) -> void:
	for node in get_children():
		if 'state_machine' in node:
			node.state_machine = self
		
		if node.has_method('setup'):
			node.setup()
	
	states_stack.push_front(get_node(state_path))
	state_changed.emit(state)
	state.begin()


func transition_to(state_name: String, kwargs := {}) -> void:
	if not has_node(state_name):
		push_error("The state '%s' was not found in the '%s'" % [state_name, owner.name])
		return
	
	if state != null:
		state.end()
	
	states_stack[0] = get_node(state_name)
	state_changed.emit(state)
	state.begin(kwargs)


func transition_queue(state_name: String, kwargs := {}) -> void:
	if not has_node(state_name):
		push_error("The state '%s' was not found in the '%s'" % [state_name, owner.name])
		return
	
	if state != null and state_name == state.name:
		push_warning("Target state and current state are the same, ignoring...");
		return
	
	if state != null:
		state.end()
	
	states_stack.push_front(get_node(state_name))
	state_changed.emit(state)
	state.begin(kwargs)


func transition_back(kwargs := {}) -> void:
	if len(states_stack) == 0:
		push_error("There is no states in the stack in the '%s'" % owner.name)
		return

	if state != null:
		state.end()
	
	states_stack.pop_front()
	state_changed.emit(state)
	state.begin(kwargs)


func is_state_active(state_name: String) -> bool:
	return state != null and state.name == state_name


func reset_fsm() -> void:
	if state != null:
		state.end()
	
	states_stack.clear()
	states_stack.append(null)
