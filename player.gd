extends CharacterBody2D

@export var acceleration := 500.0   # Speed increase per second
@export var deceleration := 800.0   # Speed decrease per second
@export var max_speed := 200.0      # Maximum movement speed
@export var gravity := 1000.0       # Gravity force

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction != 0:
		velocity.x += direction * acceleration * delta
		velocity.x = clamp(velocity.x, -max_speed, max_speed)
	else:
		if abs(velocity.x) > 0:
			var decel_amount = deceleration * delta
			if abs(velocity.x) - decel_amount < 0:
				velocity.x = 0
			else:
				velocity.x -= sign(velocity.x) * decel_amount

	velocity.y += gravity * delta
	
	# Move the character
	move_and_slide()

	if direction != 0:
		velocity.x += acceleration * delta * direction
		velocity.x = clamp(velocity.x, -max_speed, max_speed)


# extends CharacterBody2D


# @export var SPEED := 0
# @export var JUMP_VELOCITY := -400.0
# @export var acceleration := 10
# @export var deceleration := 10
# @export var MAX_SPEED := 300


# func _physics_process(delta):
# 	# Add the gravity.
# 	if not is_on_floor():
# 		velocity += get_gravity() * delta

# 	# Handle jump.
# 	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
# 		velocity.y = JUMP_VELOCITY

# 	var direction = Input.get_axis("ui_left", "ui_right")
# 	if direction:
# 		velocity.x = direction * SPEED
# 	else:
# 		velocity.x = move_toward(velocity.x, 0, SPEED)

# 	move_and_slide()
