extends Button


var dialog
func _ready() -> void:
	var dio=Dialog.new()
	dialog=dio.start(self)
	dialog.npc_name="Mr. AL"

func talk():
	dialog.text="hello there how are you ?"
	dialog.text="My name is "+ dialog.npc_name
	dialog.text="do you like Oranges?"
	#to add a question with menu
	dialog.menu("do you like Oranges?", {
			"Yes": "yes_function",
			"No": "No_function",
		})
func yes_function():
	dialog.text="Great I love them too"

func No_function():
	dialog.text="oh they are healthy. and amazing !"

	


func _on_pressed() -> void:
	talk()
