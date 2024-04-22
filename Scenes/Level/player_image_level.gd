extends Base_Level


func _ready():
	#print(Globals.GameStarted)
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
		#print(current_goal)
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

