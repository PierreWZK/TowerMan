extends KinematicBody2D

var speed = 200
var jump_speed = 420
var gravity = 20

var velocity = Vector2()

func _physics_process(_delta):
	velocity.x = (int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))) * speed
	
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2(0, -1))
	if is_on_floor() and Input.is_action_pressed("jump"):
		velocity.y = -jump_speed

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
