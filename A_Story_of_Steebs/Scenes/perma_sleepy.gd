extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
#var notice_range = 300
var player_speed = 300.0
var mouse_position = null
var direction
var close_to_mouse = 30.0
var thing_is_nearby = 40
var nudge_strength = 100
static var other_things: Array = []
var personal_space_radius = 40.0 # Distance to nudge nearby objects
var random_offset_strength = 30.0 # Strength of the random offset
var slowing_distance = 100.0 # Distance to start slowing down
var min_idle_distance = 60.0
var nudge_force = Vector2.ZERO
var stay_while_eating = null

func _ready() -> void:
	other_things.append(self)
	player_speed += randi_range(-50, 50)
	sleeping_start()

func _physics_process(delta: float) -> void:
	mouse_position = get_global_mouse_position()
	var distance_to_mouse = position.distance_to(mouse_position)

	nudge_force = Vector2.ZERO
	if not (animation.get_animation() == "eating" or animation.get_animation() == "sleeping") :
		if close_to_mouse > distance_to_mouse:
			# Stop moving
			animation.play("idle")
			velocity = Vector2.ZERO
		else:
			if distance_to_mouse >= min_idle_distance or animation.animation != "idle":
				animation.play("running")
				direction = (mouse_position - position).normalized()
			# Add a random offset to the target position
			
				var target_position = mouse_position
				# Calculate the direction towards the target position
				direction = (target_position - position).normalized()
				# Flip sprite based on direction
				animation.flip_h = direction.x < 0
				# Adjust speed based on distance to the mouse
				if distance_to_mouse < slowing_distance:
					velocity = (direction * player_speed * (distance_to_mouse / slowing_distance)) # Slow down as approaching
				else:
					velocity = direction * player_speed
				
			move_and_slide()
	else:
		if stay_while_eating:
			self.position = stay_while_eating
	
	nudge_nearby_objects()


# Function to nudge nearby objects out of the way
func nudge_nearby_objects():
	for obj in other_things:
		if obj != self:
			var distance_to_obj = position.distance_to(obj.position)
			if distance_to_obj < personal_space_radius:
				# Calculate the angle to nudge the object sideways relative to the current movement direction
				var nudge_direction = (obj.position - position).normalized()
				var nudge_velocity = nudge_direction * nudge_strength
				obj.get_nudged(nudge_velocity)

func get_nudged(nudge_velocity):
	self.velocity = nudge_velocity
	move_and_slide()
	self.velocity = Vector2.ZERO
	
func eat_blob():
	stay_while_eating = self.position
	animation.play("eating")
	$EatingTimer.start(3)
	await $EatingTimer.timeout
	animation.flip_h = false
	animation.play("sleeping")

func sleeping_start():
	animation.play("sleeping")

func _on_eating_timer_timeout() -> void:
	pass # Replace with function body.


func _on_tree_exited() -> void:
	other_things.erase(self)
	pass # Replace with function body.
