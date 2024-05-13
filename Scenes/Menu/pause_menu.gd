class_name PauseMenu
extends Control




func _on_continue_button_button_down():
	queue_free()


func _on_main_menu_button_button_down():
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")
