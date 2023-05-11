extends StaticBody2D

var totalTime = 20
var currTime
var ischopping = false
var x = 0
var DroppedAmmount = 1

var regrowRate = 5
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
	currTime = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bar.value = currTime
	if(currTime >= totalTime):
		treesprite.visible = false
		currTime = 0
		tree_is_chopped = true
		regrow.start()


func _on_area_2d_area_entered(body):
	x+=1

	if(x != 0):
		timer.start()


func _on_area_2d_area_exited(body):
	timer.stop()
	x-=1

func upgrade_drop():
	DroppedAmmount +=1


func _on_timer_timeout():
	if(tree_is_chopped == false):
		currTime += Player.strength*(x)
		print(currTime)
		var tween = get_tree().create_tween()
		tween.tween_property(bar, "value", currTime, 0.4).set_trans(Tween.TRANS_LINEAR)


func _on_regrow_timeout():
	growthbar += 1*regrowRate
	if(growthbar >= totalTime):
		growthbar = 0
		treesprite.visible = true
		tree_is_chopped = false
		regrow.stop()
