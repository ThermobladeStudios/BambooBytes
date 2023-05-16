extends CharacterBody2D

@onready var collision = $Chop_area
@export var speed = 500
@export var DashTime = 0.15
@export var DashMultiplier = 5

var strength = 5
var Dashing = false
var DashCooldown = false
var DashDirection

func _physics_process(delta):
	
	var input_direction = Vector2(Input.get_action_strength("Right") - Input.get_action_strength("Left") , Input.get_action_strength("Down") - Input.get_action_strength("Up")).normalized()
	
	if input_direction != Vector2.ZERO and !Dashing:
		collision.position = input_direction * 125
		
	if Input.is_action_pressed("Dash") and !DashCooldown and input_direction != Vector2.ZERO:
		Dashing = true
		DashCooldown = true
		DashDirection = input_direction
		$Timer.start(0.15)
		$DashCooldown.start(1)
		
	if Dashing:
		input_direction = DashDirection
		input_direction *= DashMultiplier

	velocity = input_direction * speed
	move_and_slide()

func _on_timer_timeout():
	Dashing = false

func _on_dash_cooldown_timeout():
	DashCooldown = false
