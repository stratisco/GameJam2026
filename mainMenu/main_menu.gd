extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	# res://scenes/main.tscn
	get_tree().change_scene_to_file("uid://dwcwaornvynca")


func _on_platformer_button_pressed() -> void:
	# res://platformer/platformer.tscn
	get_tree().change_scene_to_file("uid://c6ksqajr1ng7")


func _on_xor_button_pressed() -> void:
	# res://weirdPuzzle/weirdBoard.tscn
	get_tree().change_scene_to_file("uid://qq7f556h4vdj")
