extends Node2D

## Class for a recipient
## Holds the desired package and handles indicator

## Stores the desired package
var desired_package: Package = null


## Sets desired package
func call_for_package(package: Package):
	self.desired_package = package
	
	## Display notifier
	$PackageNotifier.notify(package)


## Hides notifier
func drop():
	self.desired_package = null
	$PackageNotifier.drop()
