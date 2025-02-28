extends StaticBody2D


func _process(_delta):
	if Input.is_action_pressed("timestop"):
		$LEVEL1.hide()
		$Sprite2D.show()
	if Input.is_action_pressed("unpause"):
		$LEVEL1.show()
		$Sprite2D.hide()
