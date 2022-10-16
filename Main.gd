extends Node2D


onready var player = $Player
onready var bullet_manager = $BulletManager

func _ready():
	player.connect("attach_object", bullet_manager, "attach_object")
	
