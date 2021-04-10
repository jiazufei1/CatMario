extends KinematicBody2D

#获取当前节点下边的精灵实体
onready var sprite = $Sprite

export var run_speed = 350  #移动速度
export var jump_speed = -1000 #跳跃速度
export var gravity = 2500# 重力

var velocity = Vector2.ZERO # 玩家当前移动速度

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')

	#判断是否在地板上并且是按的上键
	if is_on_floor() and jump:
		velocity.y = jump_speed
		
	if right: #向右
		velocity.x += run_speed
		sprite.scale.x = 1
	if left: #向左
		velocity.x -= run_speed
		sprite.scale.x = -1
		
#每一帧执行一次
func _physics_process(delta):
	velocity.y += gravity * delta
	#获取键盘输入
	get_input()
	#法线方向Vector2(0, -1) 等价与Vector2.UP
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_HurtArea_area_entered(area):
	print('碰到了')
	playerDie()

func playerDie():
	print('玩家死亡')
	get_tree().reload_current_scene()
