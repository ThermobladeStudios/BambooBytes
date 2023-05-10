extends CharacterBody2D

@export var speed = 500


func _process(delta):
	var input_direction = Vector2(Input.get_action_strength("Right") - Input.get_action_strength("Left") , Input.get_action_strength("Down") - Input.get_action_strength("Up"))
	if(Input.is_action_pressed("Sprint")):
		speed=1000
	elif(Input.is_action_just_released):
		speed=500
	velocity = input_direction * speed
	move_and_slide()


	
