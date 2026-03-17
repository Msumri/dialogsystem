# Godot Dialogue System

A simple **Ren'Py-style dialogue system for Godot** that allows NPCs to speak and present the player with interactive choice menus.

This system is designed to be **lightweight, modular, and easy to integrate** into existing scenes. It supports displaying NPC dialogue, showing character names, and presenting branching choices that can trigger functions in your game.

---

## Features

* NPC dialogue with speaker names & custom colors
* Dialogue UI overlay using `CanvasLayer`
* Dynamic choice menus
* Choices can call functions in the parent scene
* Trigger other functions (actions)
* Change Background
* Add sounds 
* Easy to reuse across multiple NPCs
* Works well for **visual novel style interactions**

---

## how to use 
every NPC can have thier own Dialog system. this system will create child nodes inside the NPC Node
you can watch this youtube video for full explaantion and example
var dio=Dialog.new()
var	dialo0g:=dio.start(self)
var mral=dialog.Character("Mr.AL", Color.RED,"res://addons/dialog_system/placeholder.png")

func _ready() -> void:
	#optional changing the speed  of the effect for all dialogs
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
