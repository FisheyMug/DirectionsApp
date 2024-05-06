extends TextureRect

var location = "user"
signal set_goal(goal)
var was_dropped = false


func _get_drag_data(_at_position):
	if !Globals.GameStarted:
		was_dropped = true
		var userLocation = preload("res://Scenes/Object/user_location.tscn")
		var uL = userLocation.instantiate()		
		uL.position = _at_position
		uL.texture = self.texture
		uL.set_name(self.name)
		uL.get_child(0).hide()
		uL.size.x = Globals.selected_x_length
		uL.size.y = Globals.selected_y_length
		uL.scale = Globals.selected_size
		set_drag_preview(uL)
		return uL 




func _on_gui_input(event):
	if event.is_action_released("click") and Globals.GameStarted:
		Globals.changing = true
		Globals.goal = self.name
		set_goal.emit(Globals.goal)
	
	if event.is_action_released("click") and !Globals.GameStarted:
			Globals.selected = self
			self_modulate = Color(1, 1, 0, 1)	

func _process(_delta):
	if Globals.selected != self:
		self_modulate = Color(1, 1, 1, 0.3)	
	if Globals.GameStarted:
		self_modulate = Color(1, 1, 1, 0.3)
		self.get_child(0).hide()

func _on_line_edit_text_changed(new_text):
	$".".name = "UL" + new_text
