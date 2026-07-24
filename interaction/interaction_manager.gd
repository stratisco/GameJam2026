extends Node2D


@onready var player = get_tree().get_first_node_in_group("playerGroup")
@onready var label = $Label


const baseText = "[E]"


var activeAreas = []



var canInteract = true


func registerArea(area: InteractionArea):
	activeAreas.push_back(area)
	
func unregisterArea(area: InteractionArea):
	var index = activeAreas.find(area)
	if index != -1:
		activeAreas.remove_at(index)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if activeAreas.size() > 0 && canInteract:
		activeAreas.sort_custom(_sortByDistanceToPlayer)
		#label.text = baseText + activeAreas[0].actionName #set label text here
		label.global_position = activeAreas[0].global_position
		label.global_position.y -= 100
		label.global_position.x -= label.size.x / 2
		label.show()
	else:
		label.hide()
		
		
func _sortByDistanceToPlayer(area1, area2):
	var area1ToPlayer = player.global_position.distance.distance_to(area1.global_position)
	var area2ToPlayer = player.global_position.distance.distance_to(area2.global_position)
	return area1ToPlayer < area2ToPlayer
		



func _input(event):
	if event.is_action_pressed("interact") && canInteract:
		if activeAreas.size() != 0:
			canInteract = false
			label.hide()
			
			await activeAreas[0].interact.call()
