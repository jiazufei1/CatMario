extends KinematicBody2D

#重力
export var gravity: = 3000
#速度
var _velocity: = Vector2.ZERO
#是否往下掉
var is_fall = false

func _on_Area2D_body_entered(body):
	#print('玩家踩到了陷阱')
	is_fall= true

func _physics_process(delta):
	if is_fall:
		_velocity.y += gravity * delta
		_velocity = move_and_slide(_velocity)
