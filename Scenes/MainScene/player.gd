extends CharacterBody2D

var Bullet = preload("res://Scenes/MainScene/bullet.tscn")
var canshoot = true

@onready var spawnpos = $SpawnPosition

const ACCELERATION = 1000
const FRICTION = 600
const MAX_SPEED = 400

func _physics_process(delta):
	move(delta)

func move(delta):
	var input_vector = Input.get_vector("left", "right", "up", "down")
	if input_vector == Vector2.ZERO:
		apply_friction(FRICTION * delta)
	else:
		apply_movement(input_vector * ACCELERATION * delta)
	move_and_slide()
	global_position.x = clamp(global_position.x ,0 ,1920)
	global_position.y = clamp(global_position.y ,0 ,1080)


func apply_movement(amount) -> void:
	velocity += amount
	velocity = velocity.limit_length(MAX_SPEED)

func apply_friction(amount) -> void:
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO


func _on_attack_speed_timer_timeout():
	canshoot = true

func _process(delta):
	if Input.is_action_pressed("shoot") and canshoot:
		shoot()

func shoot ():
	var bullet = Bullet.instantiate()
	bullet.position = spawnpos.global_position
	get_tree().current_scene.add_child(bullet)
	
	$AttackSpeedTimer.start()
	canshoot = false
