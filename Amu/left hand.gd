extends Area2D


onready var particle = get_node("left one")


func _on_left_hand_body_entered(body):
	if body.name == "player":
		body.health = body.health - 100
		
	if body.name == "platform":
		particle.emitting = true
