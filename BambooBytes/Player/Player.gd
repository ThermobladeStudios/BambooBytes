extends CharacterBody2D

@export var speed = 500


func _process(delta):
	var input_direction = Vector2(Input.get_action_strength("Right") - Input.get_action_strength("Left") , Input.get_action_strength("Down") - Input.get_action_strength("Up"))
	
	velocity = input_direction * speed
	move_and_slide()
