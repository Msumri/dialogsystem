extends Node
class_name Dialog
const DIALOG_SYSTEM = preload("uid://cb2qeh0ro8vw2")
var NPCS:={}
# Called when the node enters the scene tree for the first time.
var dio:Dialog_system2
func start(parent=self) -> Dialog_system2:
	dio=DIALOG_SYSTEM.instantiate()
	parent.add_child(dio)
	return  dio

func Character(NPC_NAME,color:Color=Color.WHITE,image:String ="res://addons/dialog_system/placeholder.png") :
	dio.changed_NPC_name(NPC_NAME)
	dio.change_image(image)
	NPCS[NPC_NAME][{
		"image":image,
		"color":color,
	}]
	return dio
	
