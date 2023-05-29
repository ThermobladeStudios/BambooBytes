extends Control

var strengthadd = 2.5
var rangeAdd = 0.01

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_s_but_pressed():
	PInven.addStrength(strengthadd)
	print("+1 strength")


func _on_rbut_pressed():
	PInven.addRange(rangeAdd)
	print("+1 Area")


func _on_r_bamboo_pressed():
	print("Regrowth rate increased")


func _on_1_bamboo_pressed():
	PInven.newBamboo()
	print("+1 bamboo")
