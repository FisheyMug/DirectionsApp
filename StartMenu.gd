extends Node2D

var full_screen: bool = false

func _on_button_pressed():
	Globals.GameStarted = false
	get_tree().change_scene_to_file("res://Scenes/Level/create_a_level.tscn")


func _on_city_pressed():
	Globals.GameStarted = true
	get_tree().change_scene_to_file("res://Scenes/Level/Menu/city_menu.tscn")


func _on_school_pressed():
	Globals.GameStarted = true
	get_tree().change_scene_to_file("res://Scenes/Level/Menu/school_menu.tscn")


func _on_player_made_pressed():
	Globals.GameStarted = true
	get_tree().change_scene_to_file("user://Player_Created.tscn")


func _on_full_screen_pressed():
	if  full_screen == false:
		full_screen = true
	else: full_screen = false
	if full_screen == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else : DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
