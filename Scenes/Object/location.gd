extends Area2D

var mouse_hover: bool = false
signal set_goal(goal)

func _on_body_entered(_body):
	print("You have entered the " + self.name)
	if self.name == Globals.goal:
		print("Congrats, you win!")
		Globals.win = true
	elif self.name != Globals.goal:
		print("reset")
		Globals.reset = true


#region Clicking on buildings

func _on_mouse_entered():
	mouse_hover = true


func _on_mouse_exited():
	mouse_hover = false


func _on_input_event(_viewport, event, _shape_idx):
		if event.is_action_released("click") and mouse_hover:
			Globals.changing = true
			Globals.goal = self.name
			set_goal.emit(Globals.goal)
#endregion
