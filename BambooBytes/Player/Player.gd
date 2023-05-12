extends CharacterBody2D

@onready var collision = $Chop_area
@export var speed = 500

var strength = 5

func _physics_process(delta):
	var input_direction = Vector2(Input.get_action_strength("Right") - Input.get_action_strength("Left") , Input.get_action_strength("Down") - Input.get_action_strength("Up"))
	if(input_direction != Vector2.ZERO):
		collision.position = input_direction * 125
	
	if(Input.is_action_pressed("Sprint")):
		speed=1000

	elif(Input.is_action_just_released):
		speed=500
	velocity = input_direction * speed
	move_and_slide()


	
