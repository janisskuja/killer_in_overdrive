extends Node
var high_score = 0
var safe_win = false

func game_over(score):
	if high_score < score:
		high_score = score
	get_tree().change_scene("res://GameOverMenu.tscn")

func safe_game_over(score):
	safe_win = true
	if high_score < score:
		high_score = score
	get_tree().change_scene("res://GameOverMenu.tscn")

func play():
	safe_win = false
	get_tree().change_scene("res://Main.tscn")