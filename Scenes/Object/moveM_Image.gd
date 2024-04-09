extends TextureRect

var was_dropped = false

func _get_drag_data(_at_position):
	if !Globals.GameStarted:
		was_dropped = true
		var preview = TextureRect.new()
		preview.texture = self.texture
		preview.set_name(self.name)
		#preview.scale = Vector2(1.8, 2.3)
		set_drag_preview(preview)
		return preview 
