extends Area2D

func _ready():
	pass

var in_zone = false;
func _on_Plaquecasse_body_entered(body):
	in_zone=true;
	yield(get_tree().create_timer(2), "timeout");
	in_platform();

func _on_Plaquecasse_body_exited(body):
	in_zone=false;
	in_platform();
	
func in_platform():
	if in_zone:
		get_tree().reload_current_scene();
		
	else:
		return
