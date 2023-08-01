extends KinematicBody2D


const speed = 250
const jump = -250
const gravity = 15
const UP = Vector2(0, -1)

var health = 100

var motion = Vector2()

func _physics_process(delta):
	motion.y += gravity
	get_input()
	_animation()
	_health()
	
	motion = move_and_slide(motion, UP)


func get_input():
	
	if Input. is_action_pressed("ui_right"):
		motion.x = speed
		
 elif Input. is_action_pressed("ui_left"):
		motion.x = -speed
		
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input. is_action_just_pressed("ui_up"):
			motion.y = jump
			
	if Input.is_action_just_released("ui_up"):
		if motion.y < 0:
			motion.y += 40
			
func _health():
	if health == 0:
		queue_free()
		get_tree().paused = true
		var over = get_node("../game over")
		var enemy = get_node("../Enemygimp")
		var left_hand = get_node("../left hand")
		var right_hand = get_node("../right hand")
		
		over.visible = true
		enemy.visible = false
		right_hand.visible = false
		left_hand.visible = false
		
func _animation():
	if motion.x > 0:
		$AnimationPlayer.play("walk_right")
	if motion.x < 0:
		$AnimationPlayer.play("walk_left")
	if motion.x == 0:
		$AnimationPlayer.play("idle")
	

