extends Node2D

@onready var interactionArea: InteractionArea = $InteractionArea
const FUSEBOX_MANUAL = preload("uid://dcmyldaqocosa")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactionArea.interact = Callable(self, "on_interact")



func on_interact():
	var scene = FUSEBOX_MANUAL.instantiate()
	%CanvasLayer.add_child(scene)
	globalVars.currentGUI = scene;
