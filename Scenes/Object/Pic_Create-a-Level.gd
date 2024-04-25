extends TextureRect

var location = "created"
signal set_goal(goal)
var was_dropped = false

func _on_gui_input(event):
	if event.is_action_released("click") and Globals.GameStarted:
		Globals.changing = true
		Globals.goal = self.name
		set_goal.emit(Globals.goal)

	if event.is_action_released("click") and !Globals.GameStarted:
			Globals.selected = self
			self_modulate = Color(1, 1, 0, 1)	

func _get_drag_data(_at_position):
	if !Globals.GameStarted:
		was_dropped = true
		var preview = TextureRect.new()
		preview.texture = self.texture
		preview.set_name(self.name)
		#preview.scale = Vector2(1.8, 2.3)
		preview.size.x = Globals.selected_x_length
		preview.size.y = Globals.selected_y_length
		preview.scale = Globals.selected_size
		set_drag_preview(preview)
		return preview 

func _process(_delta):
	if Globals.selected != self:
		self_modulate = Color(1, 1, 1, 1)	
