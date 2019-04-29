extends Node2D

func _ready():
	$AudioStreamPlayer.play()

func _on_Enemy_player_catched():
	$Player.die()

func _on_SafeHouse_body_entered(body):
	if body.is_in_group("player"):
		Global.safe_game_over(body.position.x)
