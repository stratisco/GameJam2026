extends Node2D

const WIRE := preload("uid://dahm1ry6bsbvv")

signal wire_cut

@export var area_2d: Area2D

var cut := false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_2d.input_event.connect(_on_input_event)


func _on_input_event(_viewport, event, _shape_i):
	if (!globalVars.hasWirecutters): return
	if (cut): return
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			wire_cut.emit()
			cut = true;
			
			
func getArea() -> Area2D:
	return area_2d
