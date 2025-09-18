extends Node2D
var num_goo = 0
var where_next = "res://Scenes/Levels/level_4.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$EndLevelMenu.hide()
	count_goo_blobs()
	
	pass # Replace with function body.


func count_goo_blobs():
	# Iterate through all the child nodes of this node
	for child in get_children():
		if child.name.begins_with("GooBlob"):
			num_goo += 1

func _on_goo_blob_tree_exited() -> void:
	num_goo -= 1
	if num_goo == 0:
		$EndLevelMenu.show()
		$AudioStreamPlayer2D.play()
	pass # Replace with function body.


func _on_goo_blob_2_tree_exited() -> void:
	num_goo -= 1
	if num_goo == 0:
		$EndLevelMenu.show()
		$AudioStreamPlayer2D.play()
	pass # Replace with function body.


func _on_goo_blob_3_tree_exited() -> void:
	num_goo -= 1
	if num_goo == 0:
		$EndLevelMenu.show()
		$AudioStreamPlayer2D.play()
	pass # Replace with function body.


func _on_goo_blob_4_tree_exited() -> void:
	num_goo -= 1
	if num_goo == 0:
		$EndLevelMenu.show()
		$AudioStreamPlayer2D.play()
	pass # Replace with function body.


func _on_goo_blob_5_tree_exited() -> void:
	num_goo -= 1
	if num_goo == 0:
		$EndLevelMenu.show()
		$AudioStreamPlayer2D.play()
	pass # Replace with function body.
	
func _on_goo_blob_6_tree_exited() -> void:
	num_goo -= 1
	if num_goo == 0:
		$EndLevelMenu.show()
		$AudioStreamPlayer2D.play()
	pass # Replace with function body.
	
func _on_goo_blob_7_tree_exited() -> void:
	num_goo -= 1
	if num_goo == 0:
		$EndLevelMenu.show()
		$AudioStreamPlayer2D.play()
	pass # Replace with function body.

func _on_goo_blob_8_tree_exited() -> void:
	num_goo -= 1
	if num_goo == 0:
		$EndLevelMenu.show()
		$AudioStreamPlayer2D.play()
	pass # Replace with function body.

func _on_goo_blob_9_tree_exited() -> void:
	num_goo -= 1
	if num_goo == 0:
		$EndLevelMenu.show()
		$AudioStreamPlayer2D.play()
	pass # Replace with function body.
