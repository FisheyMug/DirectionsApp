extends Node2D

func _on_og_school_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level/og_school_directions.tscn")



func _on_new_school_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level/this_is_my_favourite_place.tscn")
