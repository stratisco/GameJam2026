extends Node2D

@onready var wires_container: Node2D = $Wires
@onready var area2d: Area2D = $Area2D



var wires: Array[Node] = []
var wirescut = []

func _ready() -> void:
	wires = wires_container.get_children()

	for i in wires.size():
		var wire := wires[i]
		wire.wire_cut.connect(_on_wire_cut.bind(i))
		

func _on_wire_cut(i: int):
	
	match i:
		0:
			$Wires/Wire/Area2D/AnimatedSprite2D.animation = "cut"
		2:
			$Wires/Wire3/Area2D/AnimatedSprite2D.animation = "cut"
		4:
			$Wires/Wire5/Area2D/AnimatedSprite2D.animation = "cut"
		7:
			$Wires/Wire8/Area2D/AnimatedSprite2D.animation = "cut"
	
	if [0, 2, 4, 7].has(i):
		wirescut.append(i)
		if (wirescut.size() == 4):
			globalVars.fuseboxWireCut.emit()
			exit()
	else:
		globalVars.game_over_signal.emit()
		exit()
		return
		
	

func exit():
	globalVars.currentGUI = null;
	queue_free()

func _unhandled_input(event):
	if event.is_action_pressed("closeGUI") && globalVars.currentGUI == self:
		get_viewport().set_input_as_handled()
		exit()
