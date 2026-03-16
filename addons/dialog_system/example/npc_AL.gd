extends Button

var dio=Dialog.new()
var dialog:=dio.start(self)
var your_name	
func _ready() -> void:
	dialog.Character("Mr.AL", Color.RED)

func talk():
	dialog.bg("res://addons/dialog_system/bg.png")
	dialog.say("hello thereRendering text one letter at a time is most commonly called the typewriter effect or typewriter animation. This technique simulates the appearance of text being typed on a typewriter or teletype machi",true,10)
	dialog.voice("res://addons/dialog_system/coin.mp3")
	dialog.say("my name is AL what is your name? ")
	your_name=await dialog.input("name?")
	dialog.say("hello "+your_name+" nice to meet you")
	dialog.say("hI have a question for you")
	dialog.menu("do you like apples?", {
			"Yes": "yes_function",
			"No": "No_function",
		})
	

func yes_function():
	dialog.image="res://addons/dialog_system/placeholder.png"
	dialog.say("wooo 3")
	dialog.image="res://addons/dialog_system/example/saliba.png"
	dialog.say("woe 3")
func _on_pressed() -> void:
	talk()
