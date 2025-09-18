extends AnimatableBody2D
var can_be_eaten

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	can_be_eaten = true
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Steeb"):
		if "eat_blob" in body and can_be_eaten:
			body.eat_blob()  # Calls the eat_blob function on the object
			$AnimationPlayer.play("shrinking")
			can_be_eaten = false
			await $AnimationPlayer.animation_finished
			self.queue_free()
