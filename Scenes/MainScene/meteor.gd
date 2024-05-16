extends CharacterBody2D

const NAME = "meteor"

var Explosion = preload("res://Scenes/MainScene/explosion.tscn")

@onready var sprite_damage_color = $Sprite2D
@export var minspeed = 50
@export var maxspeed = 250
@export var minRotationRate = -25
@export var maxRotationRate = 25

var health = 3
var player = null
var speed = 0
var RotationRate = 0


func _ready():
	speed = randf_range(minspeed, maxspeed)
	RotationRate = randf_range(minRotationRate, maxRotationRate)

func _physics_process(delta):
	rotation_degrees += RotationRate * delta
	
	position.y += speed * delta

func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body

func enemy_hit():
	health -= 1
	$Sprite2D.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	$Sprite2D.modulate = Color.WHITE
	$HitSound.play()
	
	if health == 0:
		Global.camera.screen_shake(4, 4, 0.05)
		Global.score += 3
		queue_free()
		
	if health == 0:
		var explosion = Explosion.instantiate()
		explosion.global_position = global_position
		get_tree().current_scene.add_child(explosion)
		AudioPlayer.Explosion()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_damage_area_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit()
