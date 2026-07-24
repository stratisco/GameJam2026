extends CharacterBody2D

@export var SPEED := 120.0
@export var JUMP_VELOCITY := -320.0

@export var COYOTE_TIME := 0.10  # time after leaving the platform the player can still jump


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var coyote_timer := 0.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	# update coyote jump timer
	if is_on_floor():
		coyote_timer = COYOTE_TIME
	else:
		coyote_timer -= delta

	# allow jump if player is on ground or coyote cooldown is valid
	if Input.is_action_pressed("player_jump") and coyote_timer > 0.0:
		velocity.y = JUMP_VELOCITY
		coyote_timer = 0.0  # stop double jumping

	# then handle direction input
	var direction := Input.get_axis("player_left", "player_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	_update_animation(direction)


func _update_animation(direction: float) -> void:
	if direction != 0:
		animated_sprite.flip_h = direction < 0

	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walk")
