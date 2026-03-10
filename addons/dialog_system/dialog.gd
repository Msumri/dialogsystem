extends Node
class_name Dialog
const DIALOG_SYSTEM = preload("uid://cb2qeh0ro8vw2")

# Called when the node enters the scene tree for the first time.

func start(parent=self):
	var dio=DIALOG_SYSTEM.instantiate()
	parent.add_child(dio)
	return  dio
	
