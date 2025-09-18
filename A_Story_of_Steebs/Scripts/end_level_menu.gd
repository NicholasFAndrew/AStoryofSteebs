extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	center_menu()

# Function to center the menu
func center_menu() -> void:
	# Get the viewport size (screen size)
	var screen_size = get_viewport_rect().size

	# Calculate the position to center the node
	var center_pos = (screen_size - size) / 2

	# Set the node's position to the calculated center
	position = center_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Ensure the menu remains centered if the screen size changes (e.g. window resize)
	center_menu()

func _on_next_level_button_button_up() -> void:
	get_parent().get_parent().next_scene(get_parent().where_next)
