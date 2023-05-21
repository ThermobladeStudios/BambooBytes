extends CharacterBody2D

@onready var collisionShape = $Chop_area/CollisionShape2D
@onready var collision = $Chop_area
@export var speed = 500
@export var DashTime = 0.15
@export var DashMultiplier = 5

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

@export var hitarea = 0
@export var strength = 5
var Dashing = false
var DashCooldown = false
var DashDirection


func _physics_process(delta):
	
	var mousepos = get_global_mouse_position()
	var input_direction = Vector2(Input.get_action_strength("Right") - Input.get_action_strength("Left") , Input.get_action_strength("Down") - Input.get_action_strength("Up")).normalized()
	update_animation_parameters(input_direction)
	if(Input.is_action_just_pressed("Debugadd")):
		collisionShape.shape.size += Vector2(10,10)
	if(Input.is_action_just_pressed("Debugsubtract")):
		collisionShape.shape.size -= Vector2(10,10)
		
	
	if input_direction != Vector2.ZERO and !Dashing:
		collision.position = input_direction*($CollisionShape2D.shape.size)/2+ input_direction*(collisionShape.shape.size/2)
		
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
	pick_new_state()



func update_animation_parameters(move_input : Vector2):
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/Idle/blend_position", move_input)
		animation_tree.set("parameters/Walk/blend_position", move_input)

func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	elif(velocity == Vector2.ZERO):
		state_machine.travel("Idle")
		
func _on_timer_timeout():
	Dashing = false

func _on_dash_cooldown_timeout():
	DashCooldown = false
