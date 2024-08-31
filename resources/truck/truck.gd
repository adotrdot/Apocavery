extends Node2D

## Class for truck
## Truck can store ONE package at a time.

## Stores package
var stored_package: Package


func store(package: Package):
	self.stored_package = package
