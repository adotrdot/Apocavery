extends Control

## Class for main menu


func _ready():
	## Sets high score value
	$ScoreContainer/HighScoreValue.set_text(str(ScoreSystem.current_score))
