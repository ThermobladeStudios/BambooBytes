extends StaticBody2D
@onready var shopui = $Shop_ui/CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	shopui.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	shopui.show()


func _on_area_2d_body_exited(body):
	shopui.hide()
