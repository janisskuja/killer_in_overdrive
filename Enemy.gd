extends KinematicBody2D

export (float) var speed = 100

var velocity = Vector2()
var done = false

signal player_catched

func _ready():
	$AnimationPlayer.play("walk")

func _physics_process(delta):
	velocity.x = 0
	if !done:
		velocity.x = speed
		velocity = move_and_slide(velocity)
		if get_slide_count():
			var collider = get_slide_collision(0).collider
			if collider.is_in_group("player"):
				done = true
				emit_signal("player_catched")
	