extends Node2D

func _on_og_school_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level/School/og_school_directions.tscn")



func _on_new_school_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level/School/this_is_my_favourite_place.tscn")


func _on_menu_pressed():
	Globals.GameStarted = false
	get_tree().change_scene_to_file("res://Scenes/Level/Menu/start_menu.tscn")


func _input(event):
	if event.is_action_pressed("Menu"):
		get_tree().change_scene_to_file("res://Scenes/Level/Menu/start_menu.tscn")


func _on_lets_try_map_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level/School/new_school.tscn")
