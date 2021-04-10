extends Node2D


onready var animationPlayer = $AnimationPlayer

var is_move = false



func _on_Area2D_body_entered(body):
	if !is_move:
		is_move = true
		animationPlayer.play("start")
