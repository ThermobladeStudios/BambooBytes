extends StaticBody2D
@onready var shopui = $CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	shopui.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	print(1)
	shopui.show()


func _on_area_2d_body_exited(body):
	print(2)
	shopui.hide()
