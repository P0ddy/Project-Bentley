extends CharacterBody2D

var Bullet = preload("res://Scenes/MainScene/boss_bullet.tscn")

var canshoot = false
var player = null

var speed = 3
var Health = 50

var is_travelling = false  # Umbenannt von 'travel'

var startpos = 0
var distance = 200

signal Bossdeath

@onready var spawnpos1 = $Spawnpos1
@onready var spawnpos2 = $Spawnpos2

func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body

func _ready():
	startpos = position.y

func _physics_process(delta):
	var movement = Vector2(-speed, 0)
	
	if player:
		movement = Vector2(0, 0)
		travel()
		shoot()
	movement = move_and_collide(movement)

func travel():
	if position.y > startpos + distance:
		is_travelling = false
	if position.y < startpos - distance:
		is_travelling = true
	if is_travelling:
		move_up()
	else:
		move_down()

func move_up():
	position.y += 4

func move_down():
	position.y -= 2

func _on_shootspeed_timeout():
	canshoot = true

func shoot():
	if canshoot:
		var bullet = Bullet.instantiate()
		bullet.position = spawnpos1.global_position
		get_parent().add_child(bullet)
		
		var bullet2 = Bullet.instantiate()
		bullet2.position = spawnpos2.global_position
		get_parent().add_child(bullet2)
		
		$shootspeed.start()
		canshoot = false

func enemy_hit():
	Health -= 1
	if Health == 0:
		Global.camera.screen_shake(25, 25, 0.1)
		Global.score += 75
		Bossdeath.emit()
		queue_free()


func _on_damage_area_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit()
