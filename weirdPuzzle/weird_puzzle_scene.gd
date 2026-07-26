extends Node2D


@onready var puzzle = $WeirdPuzzle


func _ready():
	puzzle.puzzle_solved_WIN.connect(win)



func _unhandled_input(event):
	if event.is_action_pressed("closeGUI") && globalVars.currentGUI == self:
		get_viewport().set_input_as_handled()
		exit()

func win():
	globalVars.xorPuzzleCompleted.emit()
	exit()



func exit():
	globalVars.currentGUI = null;
	queue_free()
