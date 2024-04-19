extends Node2D

func _on_og_school_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level/og_school_directions.tscn")



func _on_new_school_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level/this_is_my_favourite_place.tscn")


func _on_menu_pressed():
	Globals.GameStarted = false
	get_tree().change_scene_to_file("res://Scenes/Object/start_menu.tscn")


func _input(event):
	if event.is_action_pressed("Menu"):
		get_tree().change_scene_to_file("res://Scenes/Object/start_menu.tscn")
