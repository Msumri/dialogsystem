extends Button

var dio=Dialog.new()
var dialog:=dio.start(self)
var mral=dialog.Character("Mr.AL", Color.RED,"res://addons/dialog_system/placeholder.png")


	
func talk():
	dialog.bg("res://addons/dialog_system/bg.png")
	dialog.say("Hello there ? ",mral) #add the char name at the end to customize the color of the text and how the npc name  
	dialog.say("my name is AL what is your name? ",mral)
	var user_name=await dialog.input("name?") #must use await if you are getting an imput
	dialog.say("hello "+user_name+" nice to meet you",mral)
	dialog.say("I have a question for you",mral)
	dialog.menu("do you like apples?", {
			"Yes": "yes_function",
			"No": "No_function",
		}) # the first part is the function name it must match
	

func yes_function():
	dialog.say("greate here you go have one",mral)
	dialog.action("take_apple") #trigger other function in your code to do something
	dialog.voice("res://addons/dialog_system/coin.mp3")#audio plays at this point
	dialog.say("check console",mral)

func No_function():
	dialog.say("I would have given you one",mral)
func _on_pressed() -> void:
	talk()

func take_apple():
	print("Apple Added to your inventory ")
