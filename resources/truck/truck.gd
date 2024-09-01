extends Node2D

## Class for truck
## Truck can store ONE package at a time.
## Also handles indicator.

## Stores package
var stored_package: Package


func store(package: Package):
	self.stored_package = package
	
	## Sets package's notifier
	$PackageNotifier.notify(package)


## Hides notifier
func drop():
	self.stored_package = null
	$PackageNotifier.drop()
