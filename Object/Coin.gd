extends Area2D



func _on_Coin_body_entered(body):
	print('碰撞了')
	queue_free()
