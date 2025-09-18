extends AnimatableBody2D
@onready var animation = $AnimatedSprite2D

func open_door():
	animation.play("opening")
	$CollisionShape2D.disabled = true

func close_door():
	animation.play("closing")
	$CollisionShape2D.disabled = false
