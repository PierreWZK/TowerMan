extends KinematicBody2D

var speed = 200
var jump_speed = 420
var gravity = 20
var velocity = Vector2()
var jump = 0;

var dashDirection = Vector2();
var canDash = true;
var dashing = false;



func _physics_process(_delta):
	mouvements();
	anims();
	change_scene_respawn();
	

func mouvements():
	velocity.x = (int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))) * speed
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	#DOUBLE SAUT
	if Input.is_action_pressed("jump"):
		if is_on_floor() and jump==0: 
			velocity.y = -jump_speed;
			jump=2
			yield(get_tree().create_timer(0.5), "timeout");
			jump = 1;
	
		elif !is_on_floor() and jump==1:
			$Sprite/AnimationPlayer.play("double-jump");
			velocity.y = -jump_speed;
			jump=2;
			yield(get_tree().create_timer(0.5), "timeout");
			jump = 0;
			
	elif jump==1 and is_on_floor():
		yield(get_tree().create_timer(0.05), "timeout");			
		jump=0;
	
func anims():
	# ANIMATION PERSO
	if Input.is_action_pressed("right"):
		$Sprite.flip_h = false;
		$Sprite/AnimationPlayer.play("run");
	elif Input.is_action_pressed("left"):
		$Sprite.flip_h = true;
		$Sprite/AnimationPlayer.play("run");
	elif Input.is_action_pressed("jump"):
		$Sprite/AnimationPlayer.play("jump");
	else:
		$Sprite/AnimationPlayer.play('idle');

func change_scene_respawn():
	#SCENE CHANGE TUTO
	if Input.is_action_pressed("scene_change"):
		get_tree().change_scene("res://scene/level_2.tscn");
		
	if Input.is_action_pressed("respawn"):
		get_tree().reload_current_scene();
