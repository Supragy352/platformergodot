extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -500.0
@onready var animated_sprite = $AnimatedSprite2D

# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 1200
var direction

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		velocity.x = direction * SPEED * 2

	direction = Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite.play("Turn")
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true



	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("Jump")


	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
