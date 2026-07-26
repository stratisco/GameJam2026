extends Node2D


@onready var level_timer: Timer = $TimerGui/LevelTimer
@onready var camera: Camera2D = $NoShadow/Player/Camera2D
@onready var canvas_modulate: CanvasModulate = $AffectedByShadow/CanvasModulate
@onready var player: CharacterBody2D = %Player

const PACKAGE = preload("uid://doouoohrlp8on")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ExplodeBgMusic.play()
	globalVars.totalAttemps += 1
	globalVars.game_over_signal.connect(game_over)
	
	globalVars.fuseboxWireCut.connect(fusebox_wire_cut)
	globalVars.platformerCompleted.connect(platformer_complete)
	globalVars.xorPuzzleCompleted.connect(xor_puzzle_complete)

	globalVars.spawnPackage.connect(spawnPackage)


var fuseBoxDone = false 
var platformerDone = false 
var xorDone = false 


func spawnPackage():
	$AffectedByShadow/Package.global_position = Vector2(1030, 1529)
	
func checkForAWin():
	if fuseBoxDone and platformerDone and xorDone:
		playerWins()

func fusebox_wire_cut():
	$AffectedByShadow/PowerCords/PowerCord1.turn_cable_off()
	fuseBoxDone = true
	checkForAWin()

func platformer_complete():
	$AffectedByShadow/PowerCords/PowerCord3.turn_cable_off()
	platformerDone = true
	checkForAWin()

func xor_puzzle_complete():
	$AffectedByShadow/PowerCords/PowerCord2.turn_cable_off()
	xorDone = true
	checkForAWin()

	
# level timer timeout
func _on_level_timer_timeout() -> void:
	game_over()
	
	

	
func game_over():
	# if timer times out the player loses.
	globalVars.didTheyWin = false
	$ExplodeBgMusic.stop()
	MusicManager.get_node('Explosion').play()
	await player.explode()
	
	await Fader.full_fade()
	# res://gameOver/game_over_gui.tscn
	get_tree().change_scene_to_file("uid://defjewdbd12y0")


# run this function when the player wins and defuses the bomb
func playerWins():
	globalVars.didTheyWin = true
	
	# just to make sure the timer doesnt emit a lose signal
	level_timer.stop()
	
	await Fader.full_fade()
	# res://gameOver/game_over_gui.tscn
	get_tree().change_scene_to_file("uid://defjewdbd12y0")



var shake_time := 0.0
var shake_amount := 0.0

func shake_camera(amount: float = 5.0) -> void:
	shake_time = 10.0
	shake_amount = amount

func _process(delta: float) -> void:
	if shake_time > 0.0:
		shake_time -= delta
		camera.offset = Vector2(randf_range(-shake_amount, shake_amount), randf_range(-shake_amount, shake_amount))
	else:
		camera.offset = Vector2.ZERO


func _on_level_timer_one_seconds_left() -> void:
	shake_camera()


func _on_level_timer_ten_seconds_left() -> void:
	var tween := create_tween()
	tween.tween_property(canvas_modulate, "color:r", 0.5, 10)
