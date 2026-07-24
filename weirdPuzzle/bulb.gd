@tool
extends AnimatedSprite2D

@export var is_on := true:
	set(value):
		is_on = value
		if is_inside_tree():
			play("on" if is_on else "off")

func _ready() -> void:
	play("on" if is_on else "off")

func set_state(state: bool) -> void:
	is_on = state

func toggle() -> void:
	is_on = !is_on
