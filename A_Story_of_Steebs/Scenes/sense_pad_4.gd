extends Area2D
var desired_steebs = 4
var num_of_steebs = 0
var door_open = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if num_of_steebs == desired_steebs:
		if door_open == false:
			for child in get_children():
				if child.name.begins_with("Door"):
					door_open = true
					child.open_door()
	else:
		if door_open == true:
			for child in get_children():
				if child.name.begins_with("Door"):
					door_open = false
					child.close_door()
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Steeb"):
		num_of_steebs += 1
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Steeb"):
		num_of_steebs -= 1
	pass # Replace with function body.
