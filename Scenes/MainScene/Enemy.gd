extends CharacterBody2D

var Bullet = preload("res://Scenes/MainScene/enemy_bullet.tscn")

var player = null
var canshoot = true

@export var speed = 3
var health = 4

@onready var spawnpos = $Spawnpos
@onready var muzzleflash = $MuzzleFlash

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
	if health == 0:
		Global.score += 5
		queue_free()
