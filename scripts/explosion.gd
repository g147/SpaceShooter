extends Sprite

func _ready():
	randomize()
	set_rot(deg2rad(rand_range(0,360)))
	get_node("anim")
	pass

