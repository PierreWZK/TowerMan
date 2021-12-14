extends Area2D

func _ready():
	pass

func _input(event):
		if get_overlapping_bodies().size() > 0:
			get_tree().change_scene("res://scene/Levels/Level2.tscn");
