extends Node2D

@onready var player: CharacterBody2D = $SubViewportContainer/SubViewport/PlatformPlayer
@onready var respawn_point: Node2D = $SubViewportContainer/SubViewport/RespawnPoint
@onready var spikes: Node2D = $SubViewportContainer/SubViewport/Spikes

signal player_reached_end_WIN

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.position = respawn_point.position
	for area in spikes.get_children():
		area.body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func respawn_player():
	player.position = respawn_point.position



func _on_death_void_body_entered(body: Node2D) -> void:
	if body.is_in_group("platformer_player"):
		respawn_player()


func _on_body_entered(body):
	if body.is_in_group("platformer_player"):
		respawn_player()


func _on_win_area_body_entered(body: Node2D) -> void:
	print('player made it to end of platformer')
	player_reached_end_WIN.emit()
