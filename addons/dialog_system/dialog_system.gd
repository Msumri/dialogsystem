extends CanvasLayer


#NPC Dialog imports
@onready var npc: Label = %npc_name
@onready var convo: Label = %convo
@onready var photo: TextureRect = %photo

@onready var menu_object=preload("res://addons/dialog_system/menu.tscn")

# convo varibles exposed to users
var text:="":
	set (value):
		text=value
		NPC_Dialog(value)

var image:String:
	set (value):
		image=value
		_image_changed(value)
var npc_name:="tom":
	set (value):
		npc_name=value
		NPC_Name_change(value)
var dialogue_lines:Array=[]
var current_line = 0
var menu_inst:Menu
var choicess:={}
func _ready() -> void:
	npc.text=npc_name
	hide()

func _image_changed(value):
	var im=CompressedTexture2D.new()
	im.load_path=value
	photo.texture=im
	
func NPC_Name_change(value):
	npc.text=value
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
	if menu_inst:
			menu_inst.reset()
	choicess={"question":question,"choices":choices}
	menu_inst=menu_object.instantiate()
	menu_inst.choices=choicess
	add_child(menu_inst)
	dialogue_lines.append(choicess)

	
	
	
func reset():
		current_line=0
		hide()
		dialogue_lines.clear()
		if menu_inst:
			menu_inst.reset()

func Check_for_convo():
	current_line += 1
	if current_line < dialogue_lines.size():
		if dialogue_lines[current_line] is String:
			convo.text = dialogue_lines[current_line]
		else:
			if menu_inst:
				menu_inst.show()
				current_line += 1

	else:
		reset()
