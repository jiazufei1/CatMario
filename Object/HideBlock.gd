extends Node2D



const CoinBlockDisabled = preload("res://Object/CoinBlockDisabled.tscn")

func _on_Area2D_body_entered(body):
	if body.name == 'Player' and body.velocity.y <= 0:
		print('需要生成新砖块')
		var coinBlockDisabled = CoinBlockDisabled.instance()
		get_parent().add_child(coinBlockDisabled)
		coinBlockDisabled.position = position
		
		queue_free()
