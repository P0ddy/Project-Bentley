extends Node2D

var Enemy = preload("res://Scenes/MainScene/enemy.tscn")

func _on_spawn_timer_timeout():
	var enemy = Enemy.instantiate()
	enemy.position = Vector2(randf_range(2000, 3000), randf_range(0, 1000))
	add_child(enemy)
