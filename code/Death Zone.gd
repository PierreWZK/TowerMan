extends Area2D

func _ready():
	pass

#Meurt quand on passe sur la Death zone
func _on_Death_zone_body_entered(body):
	get_tree().reload_current_scene()
