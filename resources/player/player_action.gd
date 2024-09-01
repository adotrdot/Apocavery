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
	if Input.is_action_just_pressed("action"):
		## Return if area doesn't overlap with anything
		if not self.has_overlapping_areas():
			return
			
		## Checks if overlaps with truck/recipient
		for area in self.get_overlapping_areas():
			match area.name:
				"TruckPackageArea":
					self.pickup(area.get_parent())
				"RecipientPackageArea":
					self.deliver_to(area.get_parent())


## Sets action collision rotation based on direction
func change_rotation(direction: Vector2):
	## Ignore if direction is (0,0)
	if direction == Vector2.ZERO:
		return
		
	self.set_rotation(deg_to_rad(ROTATIONS[direction]))
	
	
## Picks up package from truck
func pickup(truck: Node2D):
	var parent = self.get_parent()
	
	## Gets package from truck if not null
	if truck.stored_package == null:
		return
	parent.cur_package = truck.stored_package
	
	## Drop truck's package notifier
	truck.drop()
	
	## Emit package change signal
	parent.package_changed.emit(parent.cur_package)


## Delivers package to recipient
func deliver_to(recipient: Node2D):
	var parent = self.get_parent()
	## Returns if character isn't carrying any package
	if parent.cur_package == null:
		return
	
	## Gets recipient's desired package
	if parent.cur_package.type == recipient.desired_package.type:
		## Drop recipient's package notifier
		recipient.drop()
		
		## Change current package to null and emit delivered signal
		parent.package_delivered.emit(parent.cur_package)
		parent.cur_package = null
