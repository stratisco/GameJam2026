extends Node2D


@onready var level_timer: Timer = $TimerGui/LevelTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	globalVars.totalAttemps += 1
	globalVars.game_over_signal.connect(game_over)
	
	globalVars.fuseboxWireCut.connect(fusebox_wire_cut)
	globalVars.platformerCompleted.connect(platformer_complete)
	globalVars.xorPuzzleCompleted.connect(xor_puzzle_complete)






func fusebox_wire_cut():
	$AffectedByShadow/PowerCords/PowerCord1.turn_cable_off()

func platformer_complete():
	$AffectedByShadow/PowerCords/PowerCord3.turn_cable_off()

func xor_puzzle_complete():
	$AffectedByShadow/PowerCords/PowerCord2.turn_cable_off()


	
# level timer timeout
func _on_level_timer_timeout() -> void:
	game_over()
	
	

	
func game_over():
	# if timer times out the player loses.
	globalVars.didTheyWin = false
	
	# res://gameOver/game_over_gui.tscn
	get_tree().change_scene_to_file("uid://defjewdbd12y0")


# run this function when the player wins and defuses the bomb
func playerWins():
	globalVars.didTheyWin = true
	
	# just to make sure the timer doesnt emit a lose signal
	level_timer.stop()
	
	# res://gameOver/game_over_gui.tscn
	get_tree().change_scene_to_file("uid://defjewdbd12y0")
