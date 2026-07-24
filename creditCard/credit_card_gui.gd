extends Node2D


func _unhandled_input(event):
	if event.is_action_pressed("interact") && globalVars.currentGUI == self:
		get_viewport().set_input_as_handled()
		globalVars.currentGUI.visible = false
		globalVars.currentGUI = null;
