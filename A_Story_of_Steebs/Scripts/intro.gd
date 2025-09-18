extends Node2D
var where_next = "res://Scenes/Levels/level_1.tscn"


func _on_texture_button_button_up() -> void:
	get_parent().next_scene(where_next)
	pass # Replace with function body.
