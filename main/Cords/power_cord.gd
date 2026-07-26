extends Node2D

@onready var line: Line2D = $Line2D
@export var path: Path2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	line.points = path.curve.get_baked_points()



func turn_cable_off():
	line.default_color = '232323'
