class_name MainGame
extends Node2D

var Enemy = preload("res://Scenes/MainScene/enemy.tscn")
var Boss = preload("res://Scenes/MainScene/boss.tscn")
var Meteor = preload("res://Scenes/MainScene/meteor.tscn")
var Vel = preload("res://Scenes/MainScene/vel.tscn")

@export var spawntime: Array[float]
var stage = 0

func _ready():
	Global.game = self

func _on_spawn_timer_timeout():
	var enemy = Enemy.instantiate()
	enemy.position = Vector2(randf_range(2000, 3000), randf_range(0, 1000))
	add_child(enemy)
	var meteor = Meteor.instantiate()
	meteor.position = Vector2(randf_range(200, 1820), randf_range(-50, -50))
	add_child(meteor)
	var vel = Vel.instantiate()
	vel.position = Vector2(randf_range(2000, 3000), randf_range(50, 1030))
	add_child(vel)


# Options Scipt
@export var pause_menu_packed_scene : PackedScene = null
@onready var ui_container = $CanvasLayer as CanvasLayer

func _process(delta):
	if Input.is_action_just_pressed("Pause") and not get_tree().paused:
		var new_pause_menu : PauseMenu = pause_menu_packed_scene.instantiate()
		
		ui_container.add_child(new_pause_menu)


func _on_bosstimer_timeout():
	$SpawnTimer.stop()
	var boss = Boss.instantiate()
	boss.position = Vector2(randf_range(2200, 2200), randf_range(500, 500))
	add_child(boss)
	boss.Bossdeath.connect(on_boss_death)
	$Bosstimer.stop()

func on_boss_death():
	stage = clampi(stage + 1, 0, spawntime.size()-1)
	$SpawnTimer.start(spawntime[stage])
	$Bosstimer.start()
