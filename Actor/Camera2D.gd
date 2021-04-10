extends Camera2D


onready var topLeft = $limits/topLeft
onready var bottomRight = $limits/BottomRight


func _ready():
	#拿全局坐标
	limit_top = topLeft.global_position.y
	limit_left = topLeft.global_position.x
	limit_bottom = bottomRight.global_position.y
	limit_right = bottomRight.global_position.x
