extends CharacterBody2D



func _input(event):
	if event.is_action_released("turn_right"):
		rotate(1.57)
	if event.is_action_released("turn_left"):
		rotate(-1.57)
	if event.is_action_released("go_straight"):
		print("Go straight")
		print(global_position)




func _on_move_marker_area_entered(area):
	print (area.global_position)
