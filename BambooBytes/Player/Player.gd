extends CharacterBody2D

@onready var collisionShape = $Chop_area/SemiCircle
@onready var collision = $Chop_area

@export var speed = 500
@export var DashTime = 0.15
@export var DashMultiplier = 5

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

var Dashing = false
var DashCooldown = false
var DashDirection
var direction_to_mouse 


var isChop = false
var choptime = 0

func _physics_process(delta):
	
	var hitarea = PInven.range
	var strength = PInven.Strength
	
	collisionShape.scale = Vector2(hitarea,hitarea)
	direction_to_mouse = self.position.direction_to(get_global_mouse_position())

	var input_direction = Vector2(Input.get_action_strength("Right") - Input.get_action_strength("Left") , Input.get_action_strength("Down") - Input.get_action_strength("Up")).normalized()
	update_animation_parameters(input_direction)
		
	collision.position = direction_to_mouse*($CollisionShape2D.shape.size) + direction_to_mouse*(collisionShape.scale/2)
	animation_tree.set("parameters/Chop2/blend_position", direction_to_mouse)



	
	
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
	if(Input.is_action_just_pressed("Attack")):
		$chop.start(0.5)
		isChop = true
	pick_new_state()




func update_animation_parameters(move_input : Vector2):	
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/Idle/blend_position", move_input)
		animation_tree.set("parameters/Walk/blend_position", move_input)

		
func pick_new_state():
	if(isChop == true):
		state_machine.travel("Chop2")
	else:	
		if(velocity != Vector2.ZERO):
			state_machine.travel("Walk")

		elif(velocity == Vector2.ZERO):
			state_machine.travel("Idle")



func _on_timer_timeout():
	Dashing = false

func _on_dash_cooldown_timeout():
	DashCooldown = false
	
func _on_chop_timeout():
	choptime += 1
	if(choptime == 1):
		choptime = 0
		state_machine.travel("Idle")
		isChop = false
		$chop.stop()




func _on_animation_tree_animation_started(anim_name):
	print(anim_name)
