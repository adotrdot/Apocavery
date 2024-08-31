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


## Handles input
func handle_input():
	if Input.is_action_just_pressed("pickup"):
		self.pickup()


## Sets action collision rotation based on direction
func change_rotation(direction: Vector2):
	## Ignore if direction is (0,0)
	if direction == Vector2.ZERO:
		return
		
	self.set_rotation(deg_to_rad(ROTATIONS[direction]))
	
	
## Picks up package from truck
func pickup():
	## Checks if area overlaps with truck
	for area in self.get_overlapping_areas():
		if area.name == "PackageArea":
			## Gets package from truck
			var package: Package = area.get_parent().stored_package
			self.get_parent().cur_package = package
