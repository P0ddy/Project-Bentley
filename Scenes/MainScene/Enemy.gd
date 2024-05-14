extends CharacterBody2D

var Bullet = preload("res://Scenes/MainScene/enemy_bullet.tscn")
var Explosion = preload("res://Scenes/MainScene/explosion.tscn")

var player = null
var canshoot = true

@export var speed = 3
var health = 6

@onready var spawnpos = $Spawnpos
@onready var muzzleflash = $MuzzleFlash
@onready var enemy_sprite = $AnimatedSprite2D
@onready var hit_sound = $HitSounds
@onready var death_sound = $DeathSound

func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		
func _physics_process(_delta):
	var movement = Vector2(-speed, 0)
	
	if player:
		movement = position.direction_to(player.position) * speed
	movement = move_and_collide(movement)
	
func _on_shoot_speed_timeout():
	canshoot = true
	if player != null:
		shoot()

func shoot():
	if canshoot:
		var bullet = Bullet.instantiate()
		bullet.position = spawnpos.global_position
		get_parent().add_child(bullet)
		
		muzzleflash.play("MuzzleFlash")
		$ShootSpeed.start()
		canshoot = false

func enemy_hit():
	health -= 1
	$AnimatedSprite2D.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	$AnimatedSprite2D.modulate = Color.WHITE
	hit_sound.play()
	
	if health == 0:
		Global.camera.screen_shake(10, 10, 0.05)
		Global.score += 6
		queue_free()
		
	if health == 0:
		$DeathSound.play()
		
	if health == 0:
		var explosion = Explosion.instantiate()
		explosion.global_position = global_position
		get_tree().current_scene.add_child(explosion)
		



