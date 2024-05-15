extends Sprite2D


var players = {
	0: preload("res://Assets/Cars/StandardCar/Car1-driving-idle-Shee-WITHOUT-FLAMEt.png"),
	1: preload("res://Assets/Cars/Ferrari/Ferrari.png"),
	2: preload("res://Assets/Cars/Bus/Bus.png")
}


func _ready():
	self.texture = players[Global.PlayerSelect]
