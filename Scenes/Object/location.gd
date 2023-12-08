extends Area2D

@export var goal: String
var mouse_hover: bool = false

func _on_body_entered(_body):
	print("You have entered the " + self.name)


func _on_mouse_entered():
	mouse_hover = true
	print(mouse_hover)

func _input(event):
	if event.is_action_released("click") and mouse_hover:
		goal = self.name
		print(goal)

func _on_mouse_exited():
	mouse_hover = false
	print(mouse_hover)
