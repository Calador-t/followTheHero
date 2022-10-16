extends Node2D

export (float) var bullet_speed: float = 0
export (float) var player_gravity: float = 1000

var direction := Vector2.ZERO
var ankor: KinematicBody2D

func init(new_direction, new_ankor):
	self.ankor = new_ankor
	self.direction = new_direction
	rotation = direction.angle()

func _physics_process(delta):
	global_position += direction * delta * bullet_speed
	if ankor:
		global_position += ankor.get_protectile_goal_direction(global_position) * player_gravity * delta
