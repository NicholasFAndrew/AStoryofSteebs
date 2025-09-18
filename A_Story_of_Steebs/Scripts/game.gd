extends Node2D
var start_screen = "res://Scenes/Levels/intro.tscn"
var current_scene = null
var current_scene_path = start_screen

func _ready() -> void:
	add_child_scene(start_screen)


func _process(_delta):
	if Input.is_action_just_pressed("Reset Level"):
		get_child(0).queue_free()
		add_child_scene(current_scene_path)
	pass
# Function to load and add a scene as a child
func add_child_scene(scene_path: String) -> void:
	# Load the scene
	current_scene_path = scene_path
	var scene_resource = load(scene_path)
	
	if scene_resource:
		# Create an instance of the scene
		var scene_instance = scene_resource.instantiate()
		
		# Add the new scene as a child of this node
		add_child(scene_instance)
		
		# Store reference to the current scene
		current_scene = scene_instance
	else:
		print("Failed to load scene: ", scene_path)

# Switch to a new scene and add it as a child
func next_scene(which_scene: String) -> void:
	# Remove the current scene, if it exists
	if current_scene:
		remove_child(current_scene)
		current_scene.queue_free()
	
	# Add the new scene as a child
	add_child_scene(which_scene)
