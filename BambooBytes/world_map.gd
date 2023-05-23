extends Node2D

@onready var bnode = $Bamboos

var newbamboo = [preload("res://World Objects/bamboo.tscn").instantiate(),preload("res://World Objects/bamboo.tscn").instantiate(),preload("res://World Objects/bamboo.tscn").instantiate(),preload("res://World Objects/bamboo.tscn").instantiate(),preload("res://World Objects/bamboo.tscn").instantiate()]
var index = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(PInven.isbamboo):
		if(index < 5):
			print(newbamboo)
			bnode.add_child(newbamboo[index])
			index += 1
		else:
			print("max reached")
		addbamboo()


func addbamboo():
	PInven.noBamboo()
