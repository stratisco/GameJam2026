extends Node2D

@onready var interactionArea: InteractionArea = $InteractionArea
@onready var sprite = $Sprite2D
@onready var gui_window = %CanvasLayer/CreditCardGUI

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactionArea.interact = Callable(self, "on_interact")



func on_interact():
	globalVars.currentGUI = gui_window;
	gui_window.visible = true
