extends CharacterBody2D

@export var speed = 400
var target = destination
var moveable: bool = false
var destination: Vector2


func _input(event):
	if event.is_action_released("turn_right"):
		rotate(1.57)
		moveable = false
	if event.is_action_released("turn_left"):
		rotate(-1.57)
		moveable = false
	if event.is_action_released("go_straight"):
		print(moveable)
		if moveable:
			target = destination
			moveable = false
			velocity = position.direction_to(target) * speed
			

func _on_view_area_entered(area):
	destination = area.position
	moveable = true

#func _on_view_area_exited(_area):
	#moveable = false
	

func _physics_process(_delta):
	
	if position.distance_to(target) > 10:
		move_and_slide()
