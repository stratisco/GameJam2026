extends Control


@onready var volume_slider: HSlider = $VolumeSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_music_volume_slider_value_changed(volume_slider.value)


func _on_play_button_pressed() -> void:
	await Fader.full_fade()
	
	# res://mainMenu/description.tscn
	get_tree().change_scene_to_file("uid://bihr7nksyu32c")


func _on_platformer_button_pressed() -> void:
	# res://platformer/platformer.tscn
	get_tree().change_scene_to_file("uid://c6ksqajr1ng7")


func _on_xor_button_pressed() -> void:
	# res://weirdPuzzle/weirdBoard.tscn
	get_tree().change_scene_to_file("uid://qq7f556h4vdj")



func _on_music_volume_slider_value_changed(value: float) -> void:
	var volume_db = linear_to_db(value / 100.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), volume_db)


func _on_exit_button_pressed() -> void:
	await Fader.full_fade()
	get_tree().quit()
