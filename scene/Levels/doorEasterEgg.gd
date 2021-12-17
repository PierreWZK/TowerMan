extends Area2D

func _ready():
	pass

#ALLER VERS LE FAUX END SCREEN
func _input(event):
		if get_overlapping_bodies().size() > 0:
			get_tree().change_scene("res://scene/LevelsOthers/YOULOSE.tscn");
