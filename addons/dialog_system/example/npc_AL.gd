extends Button


var dialog
func _ready() -> void:
	var dio=Dialog.new()
	dialog=dio.start(self)
	dialog.npc_name="Mr. AL"
	dialog.show_one_char_at_a_time=true
	dialog.background="res://addons/dialog_system/bg.png"

func talk():
	dialog.text="hello there how are you ?"
	dialog.text="My name is "+ dialog.npc_name
	var name =await dialog.input("what is your name?")
	dialog.text="hello "+name
	dialog.text="do you like Oranges?"
	
	#to add a question with menu
	dialog.menu("do you like Oranges?", {
			"Yes": "yes_function",
			"No": "No_function",
		})
func yes_function():
	dialog.text="Great I love them too"
	var name =await dialog.input("what is your name?")
	dialog.menu("do you like Oranges?", {
			"Yes": "yes_function",
			"No": "No_function",
		})
	dialog.text="hello "+name
	
func No_function():
	dialog.text="oh they are healthy. and amazing !"
	


func _on_pressed() -> void:
	talk()
