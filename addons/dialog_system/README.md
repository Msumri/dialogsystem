# Godot Dialogue System

A simple **Ren'Py-style dialogue system for Godot** that allows NPCs to speak and present the player with interactive choice menus.

This system is designed to be **lightweight, modular, and easy to integrate** into existing scenes. It supports displaying NPC dialogue, showing character names, and presenting branching choices that can trigger functions in your game.

---

## Features

* NPC dialogue with speaker names
* Dialogue UI overlay using `CanvasLayer`
* Dynamic choice menus
* Choices can call functions in the parent scene
* Easy to reuse across multiple NPCs
* Works well for **visual novel style interactions**

---

## how to use 
every NPC can have thier own Dialog system. this system will create child nodes inside the NPC Node
you can watch this youtube video for full explaantion and example

var dialog
func _ready() -> void:
	var dio=Dialog.new()
	dialog=dio.start(self)
	dialog.npc_name="ellie"

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
