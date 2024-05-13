class_name MainMenu
extends Control


@export var main_game_packed_scene : PackedScene = null


func _on_start_button_button_down():
	get_tree().change_scene_to_packed(main_game_packed_scene)


func _on_options_button_button_down():
	pass # Replace with function body.


func _on_quit_button_button_down():
	get_tree().quit()