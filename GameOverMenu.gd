extends Control

func _ready():
	if Global.safe_win:
		$VBoxContainer/GameOver.text = "You got to the safe house! Congratulations!"
		$AudioStreamPlayer.play()
	elif Global.high_score > 0:
		$VBoxContainer/GameOver.text = "Almost! Your high score is: " + str(int(Global.high_score))

func _on_Button_pressed():
	Global.play()
