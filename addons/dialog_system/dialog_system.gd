extends CanvasLayer


#NPC Dialog imports
@onready var npc: Label = %npc_name
@onready var convo: Label = %convo
@onready var photo: TextureRect = %photo
@onready var next_convo: Button = %next_convo

@onready var menu_object=preload("res://addons/dialog_system/menu.tscn")
@onready var input_object=preload("res://addons/dialog_system/input.tscn")
signal input_received(value)

# convo varibles exposed to users
var text:="":
	set (value):
		text=value
		NPC_Dialog(value)
var user_input:="ggg"

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
var input_inst:Dailog_Input
var choicess:={}
var is_active:=false

func _ready() -> void:
	npc.text=npc_name
	
	hide()

func _image_changed(value):

	photo.texture=load(value)
	
func NPC_Name_change(value):
	npc.text=value
# Conov part *****
func NPC_Dialog(text:String):
	dialogue_lines.append(text)
	if dialogue_lines[current_line] is String:
		convo.text = dialogue_lines[current_line]
	is_active=true
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

	
func input(question:String):
	input_inst=input_object.instantiate()
	input_inst.user_input_changed.connect(_on_user_input_change)
	add_child(input_inst)
	var inputQ={"question":question}
	input_inst.input_Q=question
	dialogue_lines.append(inputQ)
	await input_received
	return user_input

func _on_user_input_change(value):
	user_input=value
	next_convo.disabled=false
	input_received.emit(value)
	
	
func reset():
		is_active=false
		next_convo.disabled=false
		current_line=0
		hide()
		dialogue_lines.clear()
		if menu_inst:
			menu_inst.reset()

func Check_for_convo():
	current_line += 1
	next_convo.disabled=false
	if current_line < dialogue_lines.size():
		if dialogue_lines[current_line] is String:
			convo.text = dialogue_lines[current_line]
		else:
			next_convo.disabled=true
			if menu_inst :
				menu_inst.show()
				current_line += 1
			elif input_inst:
				input_inst.show()
				current_line += 1
	else:
		reset()
