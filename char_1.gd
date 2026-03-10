extends CharacterBody2D
@onready var dialog=preload("res://dialog_System.tscn")
@onready var menu=preload("res://menu.tscn")

var dio:Dialog
var men:Menu
func _ready() -> void:
	dio=dialog.instantiate()
	dio.disable_selected_choice=true
	add_child(dio)

func _process(delta: float) -> void: 
	if Input.is_action_just_pressed("e"):
		dio.text="hello there how are you tom tom ?"
		dio.text="sub bro ?"
		convo()
func home():
	dio.disable_selected_choice=true
	dio.text="im home"
	convo()
func two(): 
	print('market')
	dio.disable_selected_choice=false
func sam():
	print("samr")
	dio.disable_selected_choice=false

	

func convo():
		dio.menu("Where do you want to go ?", {
			"home": "home",
			"market": "two",
			"func": "sam",
		})
