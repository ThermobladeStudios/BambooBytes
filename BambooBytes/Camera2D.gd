extends Camera2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (Input.is_action_just_released("ScrollUp")):
		if(zoom < Vector2(3,3)):
			zoom += Vector2(0.5,0.5)
	if (Input.is_action_just_released("ScrollDown")):
		zoom -= Vector2(0.5,0.5)
