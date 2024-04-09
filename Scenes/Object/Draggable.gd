extends TextureRect

func _get_drag_data(_at_position):
	var preview = TextureRect.new()
	preview.texture = $".".texture
	preview.set_name(self.name)
	preview.scale = Vector2(1.8, 2.3)
	set_drag_preview(preview)
	return preview
