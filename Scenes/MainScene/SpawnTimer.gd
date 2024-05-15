extends Timer

var mintime = 2
var maxtime = 6

func _ready():
	spawntime()
	timeout.connect(spawntime)

func spawntime():
	set_wait_time(randf_range(mintime, maxtime))
