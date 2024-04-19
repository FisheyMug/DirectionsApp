extends Node2D

var PlayerImageLevel 
var blankCity
var finished_level 
var levelScene
var Player_map

func _ready():
	levelScene = PackedScene.new()
	blankCity = preload("res://Scenes/Level/BlankCity01.tscn")
	PlayerImageLevel = preload("res://Scenes/Level/player_image_level.tscn")
	get_tree().get_root().files_dropped.connect(_on_files_dropped)

func _on_blankmap_button_button_up():
	var instance = blankCity.instantiate()
	$"Left Panel".add_child(instance)


func _on_button_pressed():
	#Get the "map"
	finished_level = $"Left Panel".get_child(0)
	#Get the locations node in the map
	var Ls = finished_level.get_child(4)
	var Mmarker = finished_level.get_child(3)
	#loop through the maps children in order to set the owner for saving
	for c in finished_level.get_children():
		#for each texture rect instantiate a location, add it to the location node, and set its owner
		if c.name == "Left Panel":
			for a in c.get_children():
				if "MoveMarker" in a.name:
					var m = preload("res://Scenes/Object/move_marker.tscn")
					var mmInstance = m.instantiate()
					mmInstance.set_name(a.name)
					mmInstance.position = a.position + 0.5 * a.size*2
					Mmarker.add_child(mmInstance)
					mmInstance.set_owner(finished_level)
				else: 
					var l = preload("res://Scenes/Object/location.tscn")
					var instance = l.instantiate()
					instance.set_name(a.name)
					instance.get_child(0).get_shape().size.x = a.size.x - 0.2 * a.size.x
					instance.get_child(0).get_shape().size.y = a.size.y - 0.2 * a.size.y
					#if a.location == "user":
					instance.position = a.position + 0.3 * a.size*2
					#else:
					#	instance.position = a.position + 0.5 * a.size#*2
					Ls.add_child(instance)
					instance.set_owner(finished_level)
		#Player needs to be unhidden and the owner not set to the level/map
		if c.name == "Player":
			c.show()
			continue
		c.set_owner(finished_level)
		#unhide everything else except the win message
		if c.name != "WinMessage":
			c.show()
		#The player view needs its owner set to the player
		for a in c.get_children():
			if a.name == "view":
				a.set_owner(c)
			else:
				a.set_owner(finished_level)
	
	levelScene.pack(finished_level)
	Globals.GameStarted = true
	ResourceSaver.save(levelScene, "user://Player_Created.tscn")
	ResourceSaver.save(levelScene, "res://Player_Created.tscn")
	get_tree().change_scene_to_file.bind("user://Player_Created.tscn").call_deferred()
	




func _on_load_pic_pressed():
	var instance = PlayerImageLevel.instantiate()
	#check if an instance exists so we dont add mulitple
	if $"Left Panel".get_children().size() == 0:
		$"Left Panel".add_child(instance)
		Player_map = instance.get_child(1)
	$FileDialog.popup()


func _on_file_dialog_file_selected(path):
	if Player_map.texture != null:
		Player_map.texture = null
	var image = Image.new()
	image.load(path)
	var image_texture = ImageTexture.new()
	image_texture.set_image(image)
	#Scale image to fit the left panel
	Player_map.scale.x = $"Left Panel".size.x / image_texture.get_width()
	Player_map.scale.y = $"Left Panel".size.y / image_texture.get_height()
	#add image to the level
	Player_map.texture = image_texture

func _input(event):
	if event.is_action_pressed("Menu"):
		get_tree().change_scene_to_file("res://Scenes/Object/start_menu.tscn")

func _on_esc_button_pressed():
	Globals.GameStarted = false
	get_tree().change_scene_to_file("res://Scenes/Object/start_menu.tscn")

func _process(_delta):
	if $"Left Panel".get_children().size() > 0:
		$"Esc button".hide()

func _on_files_dropped(files):
		
	var path = files[0]
	
	var image =Image.new()
	image.load(path)
	
	var texture = ImageTexture.new()
	texture.set_image(image)
	
	var instance = PlayerImageLevel.instantiate()
	#check if an instance exists so we dont add mulitple
	if $"Left Panel".get_children().size() == 0:
		$"Left Panel".add_child(instance)
		Player_map = instance.get_child(1)
		
	Player_map.scale.x = $"Left Panel".size.x / texture.get_width()
	Player_map.scale.y = $"Left Panel".size.y / texture.get_height()
	#add image to the level
	Player_map.texture = texture
