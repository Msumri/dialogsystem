extends CharacterBody2D

@onready var dialog=preload("res://dialog_System.tscn")
var dio:Dialog

func _ready() -> void:
	dio=dialog.instantiate()
	add_child(dio)
func _process(delta: float) -> void: 
	if Input.is_action_just_pressed("e"):

		dio.text="hello there how are you tom tom ?"
		dio.text="sub bro ?"
		dio.choices_list={
			"home": "home",
			"market": "two",
			"func": "sam",
		}
func home():
	dio.text="im home"
	
func two(): 
	print('market')
func sam():
	print("samr")
	


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	Input.action_press("e")
