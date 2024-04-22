extends Control

var movemarkerCounter = 0
var mouse_hover: bool = false
signal set_goal(goal)

var player;

func _can_drop_data(_at_position, _data):
	return true
	
func _drop_data(_at_position, data):
	#location = preload("res://Scenes/Object/location.tscn")
	#var instance = location.instantiate()
	if "UserLocation" in data.name:
		var userLocation = preload("res://Scenes/Object/user_location.tscn")
		var uL = userLocation.instantiate()		
		uL.position = _at_position
		uL.size.x = Globals.selected_x_length
		uL.size.y = Globals.selected_y_length
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
		#pic.scale = Vector2(1.8, 2.3)
		pic.size.x = Globals.selected_x_length
		pic.size.y = Globals.selected_y_length
		$".".add_child(pic)
	
	#instance.position = pic.position + 0.5 * pic.size*2
	#$"../locations".add_child(instance)

func _input(event):
	var increment = 10
	if !Globals.GameStarted and Globals.selected != null and !player.visible:
		if event.is_action_released("go_straight"):
			Globals.selected.size.y += increment
			Globals.selected_y_length = Globals.selected.size.y 
		if event.is_action_pressed("down"):
			Globals.selected.size.y -= increment
			Globals.selected_y_length = Globals.selected.size.y 
		if event.is_action_pressed("turn_right"):
			Globals.selected.size.x += increment
			Globals.selected_x_length = Globals.selected.size.x 
		if event.is_action_pressed("turn_left"):
			Globals.selected.size.x -= increment
			Globals.selected_x_length = Globals.selected.size.x 
