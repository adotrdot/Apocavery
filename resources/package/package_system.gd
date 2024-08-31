extends Node
class_name PackageSystem

## Class for package system
## This handles all the package generation, which packages are in the truck,
## and which of the package the recipient needed.
## This Node, when in a scene, has to have a truck scene and some recipients'
## scenes as children, and nothing else.

## Stores the truck scene
var truck: Node2D

## Stores the recipient houses' scenes
var recipients: Array = []

## Stores package needed to be delivered
var package_to_deliver: Array = []
var max_packages: int


func _ready():
	## Gets all children
	var children: Array = self.get_children()
	
	## Loops through children and stores them to the corresponding variables
	for child in children:
		match child.name:
			"Truck":
				self.truck = child
			_:
				self.recipients.append(child)
				
	## Sets max packages to the amount of recipients
	self.max_packages = 4
	self.package_to_deliver.resize(self.max_packages)
	
	## Prepare delivery
	prepare_delivery()
	
	


## Creates new randomized package
func _generate_new_package() -> Package:
	var type: int = [Package.RED, Package.BLUE, Package.GREEN].pick_random()
	return Package.new(type)
	
	
## Restocks packages, makes sure that none is null
func _restock_packages():
	## Null means no package
	for i in package_to_deliver.size():
		if package_to_deliver[i] == null:
			package_to_deliver[i] = _generate_new_package()
	
	
## Adds packages to recipients
func _add_to_recipient():
	for i in recipients.size():
		recipients[i].call_for_package(package_to_deliver[i])
	
	
## Adds a randomized package to truck
func _add_to_truck():
	truck.store(package_to_deliver.pick_random())
	
	
## Generates new package and add it to truck and a randomized recipient
func prepare_delivery():
	_restock_packages()
	
	_add_to_recipient()
	
	_add_to_truck()
