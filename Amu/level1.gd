extends Node2D

var attack = false
var attack2 = false
var game_change = 4


func _process(delta):
	_attack()
	_game_over()

func _attack():
	
	if attack == false and attack2 == false:
		$AnimationPlayer.play("idle")
		
	if attack == false and attack2 == false:
		yield(get_tree().create_timer(3),"timeout")
		attack = true
		$AnimationPlayer.play("attack")
		
	if attack2 == true and attack == false:
		$AnimationPlayer.play("attack2")
		
		
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "attack":
		attack = false
		attack2 = true
	if anim_name == "attack2":
		attack = false
		attack2 = false
		$Enemygimp.flip_v = true
		yield(get_tree().create_timer(0.5), "timeout")
		$Enemygimp.flip_v = false
		game_change = game_change - 1
		
func _game_over():
	if game_change == 0:
		get_tree().change_scene("res://level2.tscn")
