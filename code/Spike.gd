extends Area2D

func _ready():
	pass

func _on_Spike_body_entered(body):
	print(body)
	get_tree().reload_current_scene()
