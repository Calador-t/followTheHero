extends KinematicBody2D


signal add_speed(speed_added)
signal remove_speed(speed_removed)
signal attach_object(bullet, position)

export (int) var speed = 20000
export (bool) var corcle = false

onready var weapon = $Weapon


func _ready():
	weapon.connect("shoot", self, "attach_object")

func _physics_process(delta):
	var velocity = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			Input.get_action_strength("move_down") - Input.get_action_strength("move_up"))
	
	var direction = map_square_to_circle(velocity)  # needed for controller support
	
	move_and_slide(direction*delta*speed)
	look_at(get_global_mouse_position())


func _unhandled_input(event):
	if event.is_action_pressed("attack"):
		weapon.attacked(self)

func attach_object(bullet: Node2D, position: Vector2):
	emit_signal("attach_object", bullet, position)

func map_square_to_circle(cord: Vector2) -> Vector2:
	return Vector2(
		cord.x * sqrt(1 - cord.y * cord.y / 2), 
		cord.y * sqrt(1 - cord.x * cord.x / 2))

#returns direction normalized * force of change
func get_protectile_goal_direction(position: Vector2):
	#return Vector2(1,0).rotated(global_rotation)
	return (get_global_mouse_position() - position).normalized()


