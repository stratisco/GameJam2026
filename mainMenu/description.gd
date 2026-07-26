extends Control

## time to read before it starts the game
@export var readTime = 10.0

func _ready() -> void:
	await get_tree().create_timer(readTime).timeout # Wait for 2 seconds

	await Fader.full_fade()
	# res://main/main.tscn
	get_tree().change_scene_to_file("uid://dwcwaornvynca")
