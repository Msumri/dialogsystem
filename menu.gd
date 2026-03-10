extends PanelContainer
class_name  Menu

#Choises import: 
@onready var question: Label = %question
@onready var choicese: VBoxContainer = %choicese
@onready var q_box: PanelContainer = %Q_box

var choices:={}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	
	var choices_only=choices["choices"]
	question.text=choices["question"]
	for child in choicese.get_children():
		child.queue_free()
		
	for choice in choices_only:
		var choice_button:=Button.new()
		var value = choices_only[choice]
		choice_button.text=choice
		choice_button.pressed.connect(func () -> void:
			handle_choice(value,choice_button)
			
		)
		choicese.add_child(choice_button)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.

func handle_choice(opt,choice_button:Button):
	get_parent().get_parent().call(opt)
	choices.clear()
	queue_free()


	
