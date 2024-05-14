extends CharacterBody2D

var Bullet = preload("res://Scenes/MainScene/bullet.tscn")
var canshoot = true

@onready var spawnpos = $SpawnPosition
@onready var muzzleflash = $MuzzleFlashAnimation
@onready var car_sprite = $AnimatedSprite
@onready var GetDamageSound = $GetDamage
@onready var ShootingSound = $ShootingSound

const ACCELERATION = 2000
const FRICTION = 1000
const MAX_SPEED = 450

var health = 3

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

func _process(_delta):
	if Input.is_action_pressed("shoot") and canshoot:
		shoot()
		ShootingSound.play()

func shoot ():
	var bullet = Bullet.instantiate()
	bullet.position = spawnpos.global_position
	get_tree().current_scene.add_child(bullet)
	
	muzzleflash.play("MuzzleFlash")
	$AttackSpeedTimer.start()
	canshoot = false

func player_hit():
	health -= 1
	Global.health -= 1
	GetDamageSound.play()
	$AnimatedSprite.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	$AnimatedSprite.modulate = Color.WHITE
	
	
	
	if Global.health == 0:
		get_tree().change_scene_to_file("res://Scenes/Menu/game_over.tscn")
		queue_free()
		
		



