extends Node2D

@onready var bamboocount = 0
@onready var Strength = 5
@onready var range = 0.1
@onready var regrowRate = 5

@onready var isbamboo = false

func addBamboo(x):
	bamboocount += x
	
func getBamboo():
	return bamboocount

func addStrength(x):
	Strength+= x
func addRange(x):
	range+=x
	
func newBamboo():
	isbamboo = true
func noBamboo():
	isbamboo = false

