extends CharacterBody2D

const ACCELERATION = 1000
const FRICTION = 600
const MAX_SPEED = 300

func _physics_process(delta):
	move(delta)

func move(delta):
	var input_vector = Input.get_vector("left", "right", "up", "down")
	if input_vector == Vector2.ZERO:
		apply_friction(FRICTION * delta)
	else:
		apply_movement(input_vector * ACCELERATION * delta)
	move_and_slide()
	global_position.x = clamp(global_position.x ,170 ,300)
	global_position.y = clamp(global_position.y ,200 ,565)


func apply_movement(amount) -> void:
	velocity += amount
	velocity = velocity.limit_length(MAX_SPEED)

func apply_friction(amount) -> void:
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO
