extends Node2D


@onready var puzzle = $WeirdPuzzle


func _ready():
	puzzle.puzzle_solved_WIN.connect(exit)



func _unhandled_input(event):
	if event.is_action_pressed("interact") && globalVars.currentGUI == self:
		get_viewport().set_input_as_handled()
		exit()


func exit():
	globalVars.currentGUI = null;
	queue_free()
