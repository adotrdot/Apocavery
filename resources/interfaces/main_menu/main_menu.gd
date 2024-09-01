extends Control

## Class for main menu

## Signal to begin & exit game
signal begin_game
signal exit_game

func _ready():
	## Sets high score value
	$ScoreContainer/HighScoreValue.set_text(str(ScoreSystem.get_high_score()))

func _process(delta):
	if Input.is_action_just_pressed("action"):
		self.begin_game.emit()
	elif Input.is_action_just_pressed("pause"):
		self.exit_game.emit()
