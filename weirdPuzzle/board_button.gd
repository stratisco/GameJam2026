extends AnimatedSprite2D

signal hovered
signal unhovered
signal button_down
signal button_up
signal pressed

var _mouse_inside := false
var _mouse_down := false

@onready var area_2d: Area2D = $Area2D

func _ready():
	
	area_2d.mouse_entered.connect(_on_mouse_entered)
	area_2d.mouse_exited.connect(_on_mouse_exited)
	area_2d.input_event.connect(_on_input_event)


func _on_mouse_entered():
	_mouse_inside = true
	play("hover")
	hovered.emit()


func _on_mouse_exited():
	_mouse_inside = false
	_mouse_down = false
	play("default")
	unhovered.emit()


func _on_input_event(_viewport, event, _shape_i):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			_mouse_down = true
			play("pressed")
			button_down.emit()
			
		else:
			button_up.emit()
			if _mouse_down and _mouse_inside:
				pressed.emit()
			_mouse_down = false
			
			if _mouse_inside:
				play("hover")
			else:
				play("default")
