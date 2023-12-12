extends CharacterBody2D

@export var speed = 200
var target = destination
var can_move_forward: bool = false
var destination: Vector2
var faceing: int = 0
var animationToPlay = "WalkDown"
var player_moving : bool = false

func rotation(input):
	if input == "right":
		faceing +=1
	if input == "left":
		faceing -=1
	if faceing > 3:
		faceing = 0
	if faceing < 0:
		faceing = 3
	#facing Down
	if faceing == 0:
		$Sprite2D.frame = 0
		animationToPlay = "WalkDown"
	#facing Left
	if faceing == 1:
		$Sprite2D.frame = 6
		animationToPlay = "Walk_Left"
	#facing up
	if faceing == 2:
		$Sprite2D.frame = 3
		animationToPlay = "Walk_Up"
	#facing right
	if faceing == 3:
		$Sprite2D.frame = 9
		animationToPlay = "Walk_right"

func _input(event):
	if event.is_action_released("turn_right") and !player_moving:
		$view.rotate(1.57)
		rotation("right")
		can_move_forward = false
	if event.is_action_released("turn_left") and !player_moving:
		$view.rotate(-1.57)
		rotation("left")
		can_move_forward = false
	if event.is_action_released("go_straight"):
		if can_move_forward and !player_moving:
			target = destination
			velocity = position.direction_to(target) * speed
			$AnimationPlayer.play(animationToPlay)
			player_moving = true
			

func _on_view_area_entered(area):
	destination = area.position
	can_move_forward = true

	

func _physics_process(_delta):
	if position.distance_to(target) > 10:
		move_and_slide()

func _on_body_collision_area_entered(_area):
	$AnimationPlayer.stop()
	player_moving = false
	can_move_forward = true


#region Buttons

func _on_go_straight_pressed():
	var goStraight = InputEventAction.new()
	goStraight.action = "go_straight"
	Input.parse_input_event(goStraight)


func _on_turn_left_pressed():
	var turn_left = InputEventAction.new()
	turn_left.action = "turn_left"
	Input.parse_input_event(turn_left)



func _on_turn_right_pressed():
	var turn_right = InputEventAction.new()
	turn_right.action = "turn_right"
	Input.parse_input_event(turn_right)
#endregion
