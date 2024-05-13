extends Node2D

var Enemy = preload("res://Scenes/MainScene/enemy.tscn")

func _on_spawn_timer_timeout():
	var enemy = Enemy.instantiate()
	enemy.position = Vector2(randf_range(1024, 2500), randf_range(100, 2500))
	add_child(enemy)
