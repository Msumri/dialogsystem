extends Node
class_name Dialog
const DIALOG_SYSTEM = preload("uid://cb2qeh0ro8vw2")
var NPCS:={}
# Called when the node enters the scene tree for the first time.
var dio:Dialog_system
func start(parent=self) -> Dialog_system:
	dio=DIALOG_SYSTEM.instantiate()
	parent.add_child(dio)
	return  dio

	
