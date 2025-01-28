extends Base_Level

var hide: bool = false

func select_random_goal():
	current_goal = locations[randi() % locations.size()].name
	Globals.goal = current_goal
	$"Control/VBoxContainer/Sentence Container/Label".text = "My favorite place is the " + current_goal + "."
	
func globals_goal_changed():
	if Globals.changing:
		current_goal = Globals.goal	
		Globals.changing = false
		$"Control/VBoxContainer/Sentence Container/Label".text = "This is my favorite place."


func _on_card_image_view_toggled(toggled_on: bool) -> void:
	for child in $"Left Panel".get_children():
		if "MoveMarker" not in child.name:
			if toggled_on:
				hide = true
			elif !toggled_on:
				hide = false
			if hide == true:
				child.hide()
			elif hide == false:
				child.show()
