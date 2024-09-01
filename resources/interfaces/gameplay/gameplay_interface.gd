extends CanvasLayer

## Class for gameplay interface

## Stores the score and time text value to change it when needed
@onready var score_value: Label = $Control/VBoxContainer/ScoreContainer/ScoreValue
@onready var time_value: Label = $Control/VBoxContainer/TimeContainer/TimeValue

## Stores the package holder's node also to change when needed
@onready var package_holder: Control = $PackageHolder

func set_score(score: int):
	self.score_value.set_text(str(score))


func set_time(time: int):
	self.time_value.set_text(str(time) + "s")


func set_package_icon(package: Package):
	self.package_holder.set_package_icon(package)
