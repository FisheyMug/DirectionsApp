extends Control

var movemarkerCounter = 0
var mouse_hover: bool = false
signal set_goal(goal)

func _can_drop_data(_at_position, _data):
	return true
	
func _drop_data(_at_position, data):
	#location = preload("res://Scenes/Object/location.tscn")
	#var instance = location.instantiate()
	if "UserLocation" in data.name:
		var userLocation = preload("res://Scenes/Object/user_location.tscn")
		var uL = userLocation.instantiate()		
		uL.position = _at_position
		for node in uL.get_children():
			node.show()
		$".".add_child(uL)
	elif  "MoveMarker" in data.name:
		var texture = preload("res://Scenes/Object/move_m_image.tscn")
		var mm = texture.instantiate()
		mm.position = _at_position
		mm.texture = data.texture
		mm.name = "MoveMarker"
		if movemarkerCounter > 0:
			mm.name = "MoveMarker" + str(movemarkerCounter)
		#mm.scale = Vector2(1.8, 2.3)
		$".".add_child(mm)
		movemarkerCounter += 1
	else:
		var texture = preload("res://Scenes/Object/pic_create_a_level.tscn")
		var pic = texture.instantiate()
		#instance.set_name(data.name)
		
		pic.position = _at_position
		pic.name = data.name
		pic.texture = data.texture
		pic.scale = Vector2(1.8, 2.3)
		$".".add_child(pic)
	
	#instance.position = pic.position + 0.5 * pic.size*2
	#$"../locations".add_child(instance)

