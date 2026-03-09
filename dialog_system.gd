extends CanvasLayer

class_name Dialog

#NPC Dialog imports
@onready var npc: Label = %npc_name
@onready var convo: Label = %convo

#Choises import: 
@onready var question: Label = %question
@onready var choicese: VBoxContainer = %choicese
@onready var q_box: PanelContainer = %Q_box


# convo varibles exposed to users
var text:="":
	set (value):
		text=value
		NPC_Dialog(value)
var npc_name:="tom"
var dialogue_lines:Array=[]
var current_line = 0

var choices_list:={}:
	set (value):
		choices_list=value
		_choices(value)


func _ready() -> void:
	hide()
	q_box.hide()

func _process(delta: float) -> void:
	print(dialogue_lines)
# Conov part *****
func NPC_Dialog(text:String):
	dialogue_lines.append(text)
	if dialogue_lines[current_line] is String:
		convo.text = dialogue_lines[current_line]
	
	show()

func _on_next_convo_pressed() -> void:
	current_line += 1
	if current_line < dialogue_lines.size():
		if dialogue_lines[current_line] is String:
			convo.text = dialogue_lines[current_line]
		else:
			q_box.show()
		
	else:
		reset()
# End of Conov part *****

func _choices(choices_text:Dictionary):
	dialogue_lines.append(choices_text)
	for choice in choices_text:
		var choice_button:=Button.new()
		var value = choices_text[choice]
		choice_button.text=choice
		choice_button.pressed.connect(func () -> void:
			handle_choice(value)
			
		)
		choicese.add_child(choice_button)
	show()
func handle_choice(opt):
	get_parent().call(opt)
	q_box.hide()

func reset():
	current_line=0
	hide()
	choices_list.clear()
	dialogue_lines.clear()
