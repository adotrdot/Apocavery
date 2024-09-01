extends Control

## Class for gameover screen

signal confirm

func _process(delta):
	if Input.is_action_just_pressed("action"):
		## Emits exit confirmation signal
		self.confirm.emit()


func set_score_value(score: int):
	$VBoxContainer/ScoreValue.set_text(str(score))
