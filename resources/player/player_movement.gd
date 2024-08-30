extends Object
class_name PlayerMovement

## Class for player movement's logic
## Must be instanstiated inside a Character Node

## Character's speed
var speed: float

## Stores 4 way movements' inputs and vectors
const MOVEMENTS = {
	"up": Vector2.UP,
	"down": Vector2.DOWN,
	"left": Vector2.LEFT,
	"right": Vector2.RIGHT
}

## Stores record of keypress
var key_records: Array = []


## Constructor, accepts custom character's speed as parameter
func _init(speed: float = 150):
	self.speed = speed
	
	
## Checks for inputs
func get_input():
	# Reset motion to 0
	var motion = Vector2.ZERO
	
	## Loops through all the directions,
	## check to see if a key has been released, and if so, we
	## want to remove it from the key_records array
	for direction in MOVEMENTS.keys():
		if Input.is_action_just_released(direction):
			var index = key_records.find(direction)
			if index != -1:
				key_records.remove_at(index)
		if Input.is_action_just_pressed(direction):
			key_records.append(direction)

	if key_records.size():
		var direction = key_records[key_records.size() - 1]
		motion = MOVEMENTS[direction]
		
	return motion
