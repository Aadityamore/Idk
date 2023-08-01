extends Control






	
	
	
	


func _on_restart_pressed():
	get_tree().change_scene("res://level1.tscn")
	get_tree().paused = false


func _on_quit_pressed():
	get_tree().quit()
