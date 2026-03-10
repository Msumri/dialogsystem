extends Button


var dialog
func _ready() -> void:
	var dio=Dialog.new()
	dialog=dio.start(self)
	dialog.npc_name="Saliba"
	dialog.image="res://addons/dialog_system/example/saliba.png"
func talk():
	dialog.text="hello there how are you ?"
	dialog.text="do you like apples?"
	#to add a question with menu
	dialog.menu("do you like apples?", {
			"Yes": "yes_function",
			"No": "No_function",
		})
func yes_function():
	dialog.text="Great I love them too"

func No_function():
	dialog.text="oh they are healthy. they keep the Dr. Away"

	


func _on_pressed() -> void:
	talk()
