extends CanvasLayer

## Class for gameplay interface

## Stores the score and time text value to change it when needed
@onready var score_value: Label = $Control/VBoxContainer/ScoreContainer/ScoreValue
@onready var time_value: Label = $Control/VBoxContainer/TimeContainer/TimeValue


func set_score(score: int):
	score_value.set_text(str(score))


func set_time(time: int):
	time_value.set_text(str(time) + "s")
