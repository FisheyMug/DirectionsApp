extends CharacterBody2D

var moveable: bool = false
var destination: Vector2


func _input(event):
	if event.is_action_released("turn_right"):
		rotate(1.57)
	if event.is_action_released("turn_left"):
		rotate(-1.57)
	if event.is_action_released("go_straight"):
		print("Go straight")
		print(global_position)
		print(moveable)
		if moveable:
			global_position = destination
			moveable = false







func _on_view_area_entered(area):
	destination = area.position
	print(destination)
	moveable = true


func _on_view_area_exited(_area):
	moveable = false
