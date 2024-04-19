extends Node2D


func _on_button_pressed():
	Globals.GameStarted = false
	get_tree().change_scene_to_file("res://Scenes/Level/create_a_level.tscn")


func _on_city_pressed():
	Globals.GameStarted = true
	get_tree().change_scene_to_file("res://Scenes/Level/city_og.tscn")


func _on_school_pressed():
	Globals.GameStarted = true
	get_tree().change_scene_to_file("res://Scenes/Level/Menu/school_menu.tscn")


func _on_player_made_pressed():
	Globals.GameStarted = true
	get_tree().change_scene_to_file("user://Player_Created.tscn")
