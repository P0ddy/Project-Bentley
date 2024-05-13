extends Control

@onready var VolumeSlider = $"Mid Color/MarginContainer/VBoxContainer/HBoxContainer/HSlider"
@onready var MusicSlider = $"Mid Color/MarginContainer/VBoxContainer/HBoxContainer2/HSlider"
@onready var SFXSlider = $"Mid Color/MarginContainer/VBoxContainer/HBoxContainer3/HSlider"






func _on_back_to_menu_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")

func _ready():
	$Music.play()
	
	
	func _change_volumen(volumen, bus):
		if volumen == 
	
	
	
