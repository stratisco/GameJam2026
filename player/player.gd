extends CharacterBody2D

@export var PLAYER_SPEED := 350.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	var input_vector := Vector2.ZERO

	if globalVars.currentGUI == null:
		input_vector.x = Input.get_axis("player_left", "player_right")
		input_vector.y = Input.get_axis("player_up", "player_down")
		input_vector = input_vector.normalized()

	velocity = input_vector * PLAYER_SPEED

	if input_vector != Vector2.ZERO:
		sprite.play("walking")
		if input_vector.x != 0:
			sprite.flip_h = input_vector.x < 0
	else:
		sprite.play("idle")

	move_and_slide()
