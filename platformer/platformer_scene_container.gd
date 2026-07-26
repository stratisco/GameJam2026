extends Node2D

func _ready() -> void:
	$Platformer.player_reached_end_WIN.connect(win)


func win():
	globalVars.platformerCompleted.emit()
	globalVars.currentGUI = null;
	queue_free()

func _unhandled_input(event):
	if event.is_action_pressed("interact") && globalVars.currentGUI == self:
		get_viewport().set_input_as_handled()
		globalVars.currentGUI = null;
		queue_free()
