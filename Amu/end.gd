extends Area2D










func _on_end_body_entered(body):
	if body.name == "player":
		body.health = body.health - 100
