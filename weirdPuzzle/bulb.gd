extends AnimatedSprite2D

var is_on := true

func _ready() -> void:
	set_state(is_on)

func set_state(state: bool) -> void:
	is_on = state
	play("on" if is_on else "off")

func toggle() -> void:
	set_state(not is_on)
