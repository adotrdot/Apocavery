extends Area2D
class_name PlayerAction

## Class for handling character's interaction

## Stores matching directions and rotation values
const ROTATIONS = {
	Vector2.UP: 180,
	Vector2.DOWN: 0,
	Vector2.LEFT: 90,
	Vector2.RIGHT: 270
}


## Sets action collision rotation based on direction
func change_rotation(direction: Vector2):
	## Ignore if direction is (0,0)
	if direction == Vector2.ZERO:
		return
		
	self.set_rotation(deg_to_rad(ROTATIONS[direction]))
