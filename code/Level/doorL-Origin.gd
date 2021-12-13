extends Area2D

func _ready():
	pass

#ALLER VERS LES LEVELS NORMAUX
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if get_overlapping_bodies().size() > 0:
			#get_tree().change_scene("res://scene/Levels/Level1.tscn");
