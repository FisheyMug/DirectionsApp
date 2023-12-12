extends Node2D

var current_goal = Globals.goal
var locations = []
var road_markers = []
var start_position: Vector2
var start_timer: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	for node in $locations.get_children():
		locations.append(node)
	for node in $MoveMarkers/Road.get_children():
		road_markers.append(node)
	select_random_goal()
	select_random_start_location()
	$Sentence/WinMessage.hide()

func globals_goal_changed():
	if Globals.changing:
		current_goal = Globals.goal	
		print(current_goal)
		Globals.changing = false
		$Sentence/Label.text = "Where is the _____?"

func select_random_goal():
	current_goal = locations[randi() % 6].name
	Globals.goal = current_goal
	$Sentence/Label.text = "Where is the " + current_goal + "?"

func select_random_start_location():
	start_position = road_markers[randi() % road_markers.size() + 1].position
	$Player.position = start_position
	

func check_win():
	if Globals.win == true:
		start_timer = true
		$Sentence/WinMessage.show()
		if start_timer == true:
			$Timers/WinMessage.start()
			start_timer = false
			Globals.win = false

func _on_win_message_timeout():
	print("Timer is working")
	get_tree().reload_current_scene()

func _process(_delta):
	globals_goal_changed()
	check_win()


