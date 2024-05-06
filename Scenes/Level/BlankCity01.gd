extends Base_Level


func _ready():
	for pic in $"Left Panel".get_children():
		var l = preload("res://Scenes/Object/location.tscn")
		var instance = l.instantiate()
		instance.set_name(pic.name)
					
		instance.get_child(0).get_shape().size.x = pic.size.x * pic.scale.x
		instance.get_child(0).get_shape().size.y = pic.size.y * pic.scale.y
					#print(instance.get_child(0).get_shape().size)
					#instance.scale = a.scale
		instance.global_position = pic.global_position + 0.5 * pic.size * pic.scale
		$locations.add_child(instance)
		instance.set_owner($".")
	for node in $locations.get_children():
			locations.append(node)
	for node in $MoveMarkers.get_children():
		road_markers.append(node)
	select_random_goal()
	select_random_start_location()
	$WinMessage.hide()
	

func globals_goal_changed():
	if Globals.changing:
		current_goal = Globals.goal	
		Globals.changing = false
		$"Control/VBoxContainer/Sentence Container/Label".text = "Where is the _____?"

func select_random_goal():
	if locations.size() > 0: 
		current_goal = locations[randi() % locations.size()].name
		Globals.goal = current_goal
		$"Control/VBoxContainer/Sentence Container/Label".text = "Where is the " + current_goal + "?"

func select_random_start_location():
	if road_markers.size() > 0:
		start_position = road_markers[randi() % road_markers.size() - 1].position
		$Player.position = start_position
	

func check_win():
	if Globals.win == true:
		start_timer = true
		
		if start_timer == true and !Globals.player_moving:
			$WinMessage.show()
			$Timers/WinMessage.start()
			start_timer = false
			Globals.win = false
	if Globals.reset == true:
		$Player.position = start_position
		


func _on_win_message_timeout():
	get_tree().reload_current_scene()

func _process(_delta):
	for node in $"Left Panel".get_children():
		if node.was_dropped == true:
			node.queue_free()
	globals_goal_changed()
	check_win()

