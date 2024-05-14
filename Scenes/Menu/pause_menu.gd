class_name PauseMenu
extends Control


@export var pause_menu_options_packed_scene : PackedScene = null
@onready var ui_panel = $CanvasLayer as CanvasLayer

func _ready():
	get_tree().paused = true

func _on_continue_button_button_down():
	get_tree().paused = false
	queue_free()

func _on_main_menu_button_button_down():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")

func _on_options_button_pressed():
	var pause_options_menu_instance = pause_menu_options_packed_scene.instance()
	if pause_options_menu_instance:
		var pause_options_menu = pause_options_menu_instance as PauseMenu
		ui_panel.add_child(pause_options_menu)

