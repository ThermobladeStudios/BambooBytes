extends Label

var config = ConfigFile.new()

func _ready():
	if config.load("user://BambooBytes.cfg") == OK:
		PInven.bamboocount = config.get_value("Currency", "BambooCount")

func _process(delta):
	var BambooCount = PInven.bamboocount
	text = str(PInven.bamboocount)
	config.set_value("Currency", "BambooCount", BambooCount)
	config.save("user://BambooBytes.cfg")
