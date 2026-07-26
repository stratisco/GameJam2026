extends Node2D

@onready var color_rect: ColorRect = $ColorRect
const defaultFadeDuration = 0.6

var _tween: Tween

func _ready() -> void:
	color_rect.color.a = 0.0
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE

func fade_black(duration: float = defaultFadeDuration) -> void:
	color_rect.mouse_filter = Control.MOUSE_FILTER_STOP
	await _run_fade(1.0, duration)

func fade_clear(duration: float = defaultFadeDuration) -> void:
	await _run_fade(0.0, duration)
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE

func _run_fade(target_alpha: float, duration: float) -> void:
	if _tween and _tween.is_running():
		_tween.kill()
	_tween = create_tween()
	_tween.tween_property(color_rect, "color:a", target_alpha, duration)
	await _tween.finished


func full_fade(duration: float = defaultFadeDuration) -> void:
	await fade_black(duration)
	await get_tree().create_timer(0.15).timeout # Wait 0.3 seconds
	fade_clear(duration)
