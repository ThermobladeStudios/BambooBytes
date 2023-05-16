extends Node2D

@onready var bamboocount = 0


func addBamboo(x):
	bamboocount += x
	
func getBamboo():
	return bamboocount
