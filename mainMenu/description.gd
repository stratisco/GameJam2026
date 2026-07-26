extends Control


@onready var timer: Timer = $Timer
@onready var progress_bar: ProgressBar = $ProgressBar

func _ready() -> void:
	progress_bar.max_value = timer.wait_time
	progress_bar.value = timer.wait_time

func _process(_delta: float) -> void:
	progress_bar.value = timer.wait_time - timer.time_left


func proceed():
	await Fader.full_fade()
	# res://main/main.tscn
	get_tree().change_scene_to_file("uid://dwcwaornvynca")


func _on_timer_timeout() -> void:
	proceed()


func _on_skip_button_pressed() -> void:
	proceed()
