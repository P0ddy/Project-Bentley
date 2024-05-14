class_name MainMenu
extends Control


@export var main_game_packed_scene : PackedScene = null


func _on_start_button_button_down():
	get_tree().change_scene_to_packed(main_game_packed_scene)
	Global.score = 0
	Global.health = 3


func _on_options_button_button_down():
	get_tree().change_scene_to_file("res://Scenes/Menu/options_menu.tscn")


func _on_quit_button_button_down():
	get_tree().quit()
	
	
