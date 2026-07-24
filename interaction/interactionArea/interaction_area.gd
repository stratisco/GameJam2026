extends Area2D
class_name InteractionArea


@export var action_name: String = "interact"

var interact: Callable = func():
	pass


func _on_body_entered(_body: Node2D) -> void:
	InteractionManager.registerArea(self)


func _on_body_exited(_body: Node2D) -> void:
	InteractionManager.unregisterArea(self)
