extends Node2D

const InputMenu = preload("addons/godot-lazy-input-settings/input_menu.gd")

func _ready():
	InputMenu.load_input_map_from_file("user://input_map.json")
	get_node("InputMenu").update()
	set_process_unhandled_input(true)

func _unhandled_input(event):
	for action in InputMap.get_actions():
		if event.is_action_pressed(action):
			get_node("Label").set_text(action)
			get_tree().set_input_as_handled()
			return

	get_node("Label").set_text("...")