class_name MainGame
extends Node2D

var Enemy = preload("res://Scenes/MainScene/enemy.tscn")

func _on_spawn_timer_timeout():
	var enemy = Enemy.instantiate()
	enemy.position = Vector2(randf_range(2000, 3000), randf_range(0, 1000))
	add_child(enemy)



@export var pause_menu_packed_scene : PackedScene = null
@onready var ui_container = $CanvasLayer as CanvasLayer	

func _unhandled_input(event) -> void:
	if event.is_action("Pause"):
		var new_pause_menu : PauseMenu = pause_menu_packed_scene.instantiate()
		
		ui_container.add_child(new_pause_menu)
