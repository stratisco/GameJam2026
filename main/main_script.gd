extends Node2D


@onready var level_timer: Timer = $TimerGui/LevelTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	globalVars.totalAttemps += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

	
# level timer timeout
func _on_level_timer_timeout() -> void:
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
