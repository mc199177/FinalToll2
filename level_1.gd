extends StaticBody2D


func _process(_delta):
	if Input.is_action_pressed("timestop"):
		$LEVEL1.hide()
		$Sprite2D.show()
	if Input.is_action_pressed("unpause"):
		$LEVEL1.show()
		$Sprite2D.hide()

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	$"../../levell2".show()
	$"..".hide()
	pass # Replace with function body.
