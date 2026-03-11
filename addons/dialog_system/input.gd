extends PanelContainer
class_name Dailog_Input
@onready var label: Label = %Label
@onready var yourinput: LineEdit = %yourinput

signal user_input_changed(value)
var input_Q:="":
	set (value):
		input_Q=value
		_changed_input(value)
var answer:String=""

func _changed_input(value):
	label.text=value

func _ready() -> void:
		hide()

func _on_submit_pressed() -> void:
	user_input()
	queue_free()
func _on_yourinput_text_submitted(new_text: String) -> void:
	user_input()
	queue_free()
func user_input():
	user_input_changed.emit(answer)

func _on_yourinput_text_changed(new_text: String) -> void:
	answer=yourinput.text

func reset():
	queue_free()
