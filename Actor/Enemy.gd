extends KinematicBody2D

export var run_speed = 350  #移动速度
export var gravity = 2500  #重力
var velocity = Vector2.ZERO # 当前移动速度

func _ready():
	velocity.x = -run_speed

func _physics_process(delta):
	velocity.y += gravity * delta
	#判断撞墙
	if is_on_wall():
		velocity.x *= -1.0
	
	velocity.y = move_and_slide(velocity,Vector2.UP).y

func _on_HurtArea_body_entered(body):
	queue_free()
