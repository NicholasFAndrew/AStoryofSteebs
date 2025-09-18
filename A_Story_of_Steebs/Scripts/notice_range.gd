extends Sprite2D

var mouse_position = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_position = get_global_mouse_position()
	self.position = mouse_position
