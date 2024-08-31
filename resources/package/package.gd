extends Object
class_name Package

## Class for a package
## Has 3 types of package available, that is Red, Blue, and Green

## Enums to stores types of packages
enum {
	RED,
	BLUE,
	GREEN
}

## Stores the type of current package
var type: int


func _init(type: int):
	## Handle wrong type of package
	assert(type in [self.RED, self.BLUE, self.GREEN], "Wrong type of package")
	
	self.type = type
