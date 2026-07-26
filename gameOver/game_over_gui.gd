extends Control


@onready var attempts_label: Label = $Attempts


@onready var fail_screen: Control = $Fail
@onready var succeed_screen: Control = $Succeed


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	attempts_label.text = 'Attempt: %d' % globalVars.totalAttemps
	
	fail_screen.visible = false
	succeed_screen.visible = false
	
	
	if globalVars.didTheyWin:
		succeed_screen.visible = true
	else:
		fail_screen.visible = true



func _on_try_again_button_pressed() -> void:
	globalVars.hasWirecutters = false
	globalVars.currentGUI = null
	globalVars.wirecuttersOrdered = false
	
	# res://scenes/main.tscn
	get_tree().change_scene_to_file("uid://dwcwaornvynca")


func _on_play_again_pressed() -> void:
	globalVars.didTheyWin = false
	globalVars.totalAttemps = 0
	
	_on_try_again_button_pressed()
