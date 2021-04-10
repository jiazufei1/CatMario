#func _get_configuration_warning(): 生效的话需要饮用这个tool
tool

extends Area2D

export var next_level:PackedScene

onready var animate_player = $AnimationPlayer


func _get_configuration_warning():
	var hintString = ''
	if not next_level: 
		hintString = '没有设置下一关的场景'
	else :
		hintString = ''
	
	return  hintString
	#return '没有设置下一关的场景' if not next_level else ''


func _on_Flag_body_entered(body):
	animate_player.play("Start")
	#等待动画结束再执行后续代码
	yield(animate_player,"animation_finished")
	get_tree().change_scene_to(next_level)
