extends TextureRect

var location
signal set_goal(goal)
var was_dropped = false

func _on_gui_input(event):
	if event.is_action_released("click"):
		Globals.changing = true
		Globals.goal = self.name
		set_goal.emit(Globals.goal)

func _get_drag_data(_at_position):
	if !Globals.GameStarted:
		was_dropped = true
		var preview = TextureRect.new()
		preview.texture = self.texture
		preview.set_name(self.name)
		preview.scale = Vector2(1.8, 2.3)
		set_drag_preview(preview)
		return preview 
