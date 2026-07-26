extends Node2D

const WIRE := preload("uid://dahm1ry6bsbvv")

signal wire_cut

@export var area_2d: Area2D

var cut := false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_2d.input_event.connect(_input_event)
	area_2d.z_index = z_index


#func _on_input_event(_viewport, event, _shape_i):
	#if (!globalVars.hasWirecutters): return
	#if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		#if event.pressed:
			#wire_cut.emit()

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var query = PhysicsPointQueryParameters2D.new()
		query.position = get_global_mouse_position()
		query.collide_with_areas = true

		var result = get_world_2d().direct_space_state.intersect_point(query)

		print(result)

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		var space_state = get_world_2d().direct_space_state
		var parameters = PhysicsPointQueryParameters2D.new()

		parameters.position = Vector2(get_global_mouse_position())
		parameters.collide_with_bodies = true
		parameters.collide_with_areas = true

		var results = space_state.intersect_point(parameters, 32)

		var top_wire = null
		var top_z = -INF
		print("results size: " + str(results.size()))
		#print(results)
		for result in results:
			var area = result.collider
			#print(area)
			#if area.get_script() == WIRE:
			#print("areaz:" + str(area.z_index))
			if area.z_index > top_z:
				top_wire = area
				top_z = area.z_index
		#print(top_wire)
		#print(top_z)
		if top_wire == area_2d:
			print("clicked: " + self.name)
			wire_cut.emit()


func getArea() -> Area2D:
	return area_2d
