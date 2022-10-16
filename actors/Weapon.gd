extends Node2D

signal shoot(object, position)

export (PackedScene) var bullet


onready var end_of_gun = $EndOfGun

func attacked(player: KinematicBody2D):
	var bullet_instace = bullet.instance()
	bullet_instace.init(Vector2(1,0).rotated(player.global_rotation), player)
	emit_signal("shoot", bullet_instace, end_of_gun.global_position)


