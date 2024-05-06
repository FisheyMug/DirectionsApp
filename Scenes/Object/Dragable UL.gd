extends TextureRect
var was_dropped = false

func _get_drag_data(_at_position):
	if !Globals.GameStarted:
		was_dropped = true
		var userLocation = preload("res://Scenes/Object/user_location.tscn")
		var uL = userLocation.instantiate()		
		uL.position = _at_position
		uL.texture = self.texture
		uL.set_name("UL")
		uL.get_child(0).hide()
		uL.size.x = Globals.selected_x_length
		uL.size.y = Globals.selected_y_length
		uL.scale = Globals.selected_size
		set_drag_preview(uL)
		return uL 
