extends Node2D



func _on_city_v_1_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level/city_og.tscn")


func _on_city_v_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level/City/cityV2.tscn")


func _input(event):
	if event.is_action_pressed("Menu"):
		Globals.GameStarted = false
		get_tree().change_scene_to_file("res://Scenes/Level/Menu/start_menu.tscn")

func _on_button_pressed():
	Globals.GameStarted = false
	get_tree().change_scene_to_file("res://Scenes/Level/Menu/start_menu.tscn")
