extends Area2D

func _ready():
	pass

func _input(event):
		if get_overlapping_bodies().size() > 0:
			get_tree().change_scene("res://scene/LevelsOthers/LevelTuto2.tscn");
