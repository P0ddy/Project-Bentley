class_name PauseMenu
extends Control


@export var pause_menu_options_packed_scene : PackedScene = null
@onready var ui_panel = $Panel as CanvasLayer

func _on_continue_button_button_down():
	queue_free()


func _on_main_menu_button_button_down():
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")
	

func _on_options_button_pressed():
	ui_panel.add_child(pause_options_menu)

var pause_options_menu : PauseMenu = pause_menu_options_packed_scene.instantiate()

