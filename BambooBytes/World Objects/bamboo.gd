extends StaticBody2D

var totalTime = 20
var currTime
var ischopping = false
var x = false
@export var DroppedAmmount : int

@export var regrowRate = 5
var tree_is_chopped = false

var growthbar = 0

@onready var treesprite = $Sprite2D
@onready var Player = $"../../Player"
@onready var timer = $Timer
@onready var regrow = $Regrow
@onready var bar = $ChopProgress



# Called when the node enters the scene tree for the first time.
func _ready():
	bar.max_value = totalTime
	currTime = totalTime


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bar.value = currTime
	if(currTime == totalTime):
		bar.visible=false
	elif(currTime <= totalTime && tree_is_chopped == false):
		bar.visible = true
	if(currTime <= 0 && tree_is_chopped == false):
		PInven.addBamboo(DroppedAmmount)
		treesprite.frame = 0
		bar.visible = false
		currTime = growthbar
		tree_is_chopped = true
		regrow.start()
	if(x):
		if(Input.is_action_just_pressed("Attack")):
			if(tree_is_chopped == false):
				currTime -= Player.strength
				print(currTime)
				var tween = get_tree().create_tween()
				tween.tween_property(bar, "value", currTime, 0.4).set_trans(Tween.TRANS_QUAD)
func _on_area_2d_area_entered(body):
	x= true

	

func _on_area_2d_area_exited(body):
	x=0

func upgrade_drop():
	DroppedAmmount +=1



func _on_regrow_timeout():
	growthbar += 1*regrowRate
	currTime = growthbar
	if(growthbar >= totalTime):
		growthbar = 0
		treesprite.frame = 1
		tree_is_chopped = false
		regrow.stop()
