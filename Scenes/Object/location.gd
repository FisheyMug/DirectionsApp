extends Area2D

signal set_goal(goal)
var was_dropped = false

func _on_body_entered(_body):
	if self.name == Globals.goal:
		Globals.win = true
	elif self.name != Globals.goal:
		Globals.reset = true
#func _process(delta):
	#print(self.get_child(0).get_shape().size)
	
