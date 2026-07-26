extends Node2D

@onready var interactionArea: InteractionArea = $InteractionArea


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactionArea.interact = Callable(self, "on_interact")



func on_interact():
	print("interacted!")
	globalVars.hasWirecutters = true
