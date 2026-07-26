extends Node2D

@onready var interactionArea: InteractionArea = $InteractionArea
const GUI_SCENE = preload("uid://dh1cbi25w6817")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactionArea.interact = Callable(self, "on_interact")



func on_interact():
	var scene = GUI_SCENE.instantiate()
	%CanvasLayer.add_child(scene)
	globalVars.currentGUI = scene;
