extends Button

var dio=Dialog.new()
var dialog:=dio.start(self)
#Character(NPC_name, font color, npc image)
var aya=dialog.Character("Aya", Color.ORANGE,"res://addons/dialog_system/example/saliba.png") 
var mral=dialog.Character("Mr.AL", Color.RED,"res://addons/dialog_system/placeholder.png")
func _ready() -> void:
	dialog.typewriter_speed=10 #change the speed of text appreaing
	dialog.typewriter=true #if false the effect will be off
	
func talk():
	dialog.bg("res://addons/dialog_system/bg.png")
	dialog.say("Hello there ? ",aya) #add the char name at the end to customize the color of the text and how the npc name  
	dialog.say("my name is Aya what is your name? ",aya,false ) # the false stop the type writing effect so you can change it per line 
	var user_name=await dialog.input("name?") #must use await if you are getting an imput
	dialog.say("Hello "+user_name+" nice to meet you",aya)
	dialog.say("I have a question for you",aya)
	dialog.menu("do you like Oranges?", {
			"Yes": "yes_function",
			"No": "No_function",
		}) # the first part is the function name it must match
	

func yes_function():
	dialog.image='res://addons/dialog_system/placeholder.png' #this will change the sprite image no matter who is the speaker 
	dialog.say("greate here you go have one",aya)
	dialog.action("take_Orange") #trigger other function in your code to do something
	dialog.image="" # this will retrun the image to the char image
	dialog.voice("res://addons/dialog_system/coin.mp3")#audio plays at this point
	dialog.say("check console",aya)

func No_function():
	dialog.say("Good im actuly Mr. AL I tricked you it was a bad orange",mral)# you can have multiple char in one convo if you want to give the npc personalites
	
func _on_pressed() -> void:
	talk()

func take_Orange():
	print("Orange Added to your inventory ")
