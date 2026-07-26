extends Node2D


@onready var label = $Label
@onready var lineEdit = $LineEdit


var labelText = []

var mode = "normal"
var itemOrdered


func onEnter():
	lineEdit.grab_focus()



func _input(event):
	if event.is_action_pressed("ui_text_submit"):
		parseTextEntry(lineEdit.text)
		lineEdit.text = ""


func parseTextEntry(text):
	labelText.push_front("> " + text)
	
	
	match mode:
		"shop":
			match text:
				"1":
					labelText.push_front("Please enter your credit card number.")
					mode = "credit"
					itemOrdered = "Blast Proof Shield"
				"2":
					labelText.push_front("Please enter your credit card number.")
					mode = "credit"
					itemOrdered = "Bomb Difusal Manual"
				"3":
					if globalVars.wirecuttersOrdered:
						labelText.push_front("Out of stock!")
						mode = "normal"
					else:
						labelText.push_front("Please enter your credit card number.")
						mode = "credit"
						itemOrdered = "Wire Cutters"
				"4":
					labelText.push_front("Please enter your credit card number.")
					mode = "credit"
					itemOrdered = "Bad Guy Destroyer"
				_:
					labelText.push_front("Invalid option. Returning to terminal")
					mode = "normal"
		
	
		"credit":
			if (text == "12784396"):
				if itemOrdered == "Wire Cutters":
					labelText.push_front("Wire Cutters ordered.")
					globalVars.wirecuttersOrdered = true
					globalVars.hasWirecutters = true
				else:
					labelText.push_front("Insufficient funds. Transaction cancelled.")
			
			else:
				labelText.push_front("Incorrect details. Transaction cancelled.")
			mode = "normal"
		"normal":
			match text:
				"hi":
					labelText.push_front("hello!")
				"exit":
					exit()
				"shop":
					labelText.push_front("press 1 to order blast proof shield ($50)")
					labelText.push_front("press 2 to order bomb diffusal manual (9$)") 
					labelText.push_front("press 3 to order wirecutters ($8)")
					labelText.push_front("press 4 to order bad guy destroyer ($150)")
					mode = "shop"
				"help":
					labelText.push_front("exit - exits the terminal")
					labelText.push_front("help - displays this list")
					labelText.push_front("shop - opens the online shopping and delivery service menu")
				_:
					labelText.push_front("unrecognised command. type 'help' for a list of available commands")
	updateText()





func updateText():
	label.text = ">"
	for i in range(min(25, labelText.size())):
		label.text =  labelText[i] + "\n" + label.text
	

	
	
func exit():
	globalVars.currentGUI = null;
	lineEdit.release_focus()
	queue_free()
