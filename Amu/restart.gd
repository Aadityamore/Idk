extends Button


func _process(delta):
	pass

func _on_restart_pressed():
	get_tree().change_scene("res://level1.tscn")
