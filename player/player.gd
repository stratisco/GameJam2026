extends CharacterBody2D


## Speed that the player moves through the map
@export var PLAYER_SPEED := 350.0


# player movement function
func _physics_process(delta: float) -> void:
	var input_vector := Vector2.ZERO
	
	# get inputs
	input_vector.x = Input.get_axis("player_left", "player_right")
	input_vector.y = Input.get_axis("player_up", "player_down")
	
	# limit speed
	input_vector = input_vector.normalized()
	velocity = input_vector * PLAYER_SPEED

	move_and_slide()
