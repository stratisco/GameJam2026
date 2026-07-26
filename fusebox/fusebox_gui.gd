extends Node2D

@onready var wires_container: Node2D = $Wires



var wires: Array[Node] = []


func _ready() -> void:
	wires = wires_container.get_children()
	
	for i in wires.size():
		var wire = wires[i]
		wire.wire_cut.connect(_on_wire_cut.bind(i))


func _on_wire_cut(i: int):
	print("wire" + str(i))
	if (i == 3):
		pass # correct wire cut
	else:
		globalVars.game_over_signal.emit()
		
		


func _unhandled_input(event):
	if event.is_action_pressed("interact") && globalVars.currentGUI == self:
		get_viewport().set_input_as_handled()
		globalVars.currentGUI = null;
		queue_free()
