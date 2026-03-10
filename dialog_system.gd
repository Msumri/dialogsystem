extends CanvasLayer

class_name Dialog

#NPC Dialog imports
@onready var npc: Label = %npc_name
@onready var convo: Label = %convo

@onready var menu_object=preload("res://menu.tscn")

# convo varibles exposed to users
var text:="":
	set (value):
		text=value
		NPC_Dialog(value)
var npc_name:="tom"
var dialogue_lines:Array=[]
var current_line = 0
var menu_inst:Menu
var choicess:={}
func _ready() -> void:
	hide()


# Conov part *****
func NPC_Dialog(text:String):
	dialogue_lines.append(text)
	if dialogue_lines[current_line] is String:
		convo.text = dialogue_lines[current_line]
	
	show()

func _on_next_convo_pressed() -> void:
	Check_for_convo()
# End of Conov part *****


	
func menu(question:String, choices:Dictionary):
	choicess={"question":question,"choices":choices}
	menu_inst=menu_object.instantiate()
	menu_inst.choices=choicess
	add_child(menu_inst)
	dialogue_lines.append(choicess)

	
	
	
func reset():
		current_line=0
		hide()
		dialogue_lines.clear()
	

func Check_for_convo():
	current_line += 1
	if current_line < dialogue_lines.size():
		if dialogue_lines[current_line] is String:
			convo.text = dialogue_lines[current_line]
		else:
			menu_inst.show()
			current_line += 1

	else:
		reset()
