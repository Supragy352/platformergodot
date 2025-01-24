extends State

class_name PlayerIdle

@export var sprite:AnimatedSprite2D

func Enter():
	sprite.play("Idle")
	pass

func Exit():
	pass

func Update(_delta:float):
	pass
