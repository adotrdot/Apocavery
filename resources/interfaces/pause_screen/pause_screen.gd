extends Control

## Signals to resume game
signal resume

## Signals to go back to main menu
signal quit

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		resume.emit()
	elif Input.is_action_just_pressed("back_to_main_menu"):
		quit.emit()
