extends CharacterBody2D

const gravity := 9

var speed := 120
var heading := 0.0
var jump := 235

@onready var anim := $AnimationPlayer
@onready var sprite := $Sprite2D

func _physics_process(delta):
	heading = Input.get_axis("ui_left","ui_right")
	velocity.x = heading * speed
	
	if heading != 0:
		anim.play("walk")
	else:
		anim.play("idle")
	
	sprite.flip_h = heading < 0 if heading != 0 else sprite.flip_h
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y -= jump
	velocity.y += gravity
	
	if global_position.y > 250:
		game_over()
	
	move_and_slide()
	
func game_over():
	get_tree().reload_current_scene()
	
	
	
	

