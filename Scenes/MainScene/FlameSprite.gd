extends Sprite2D


var players = {
	0: preload("res://Assets/Cars/StandardCar/Car1-driving-idle-Sheet-FLAME-ONLY.png"),
	1: preload("res://Assets/Cars/Ferrari/FerrariFlamme.png"),
	2: preload("res://Assets/Cars/Bus/BusFlame.png")
}


func _ready():
	self.texture = players[Global.PlayerSelect]
