extends KinematicBody2D

export (float) var speed = 100
export (float) var jump_str = -400
var gravity = 1200
var is_dead = false

var velocity = Vector2()

func set_velocity_x(vel):
	velocity.x = vel

func die():
	is_dead = true
	$AnimationPlayer.play("dead")
	$AudioStreamPlayer.play()
	$AudioStreamPlayer.connect("finished", self, "game_over")

func game_over():
	Global.game_over(position.x)

func _process(delta):
	if !is_dead:
		if position.y > 800:
			die()
		if velocity.x != 0:
			$AnimationPlayer.play("run")
		else:
			$AnimationPlayer.play("idle")

func _physics_process(delta):
	if !is_dead:
		velocity.x = 0
		if Input.is_action_just_pressed('ui_select') and is_on_floor():
			velocity.y = jump_str
		if Input.is_action_pressed('ui_right'):
			velocity.x += speed
		if Input.is_action_pressed('ui_left'):
			velocity.x -= speed
		
		velocity.y += gravity * delta
		velocity = move_and_slide(velocity, Vector2(0, -1))
