extends Area2D

export var armour = 2 setget set_armour
export var velocity = Vector2()

func _ready():
	set_process(true)
	add_to_group("enemy")
	connect("area_entered", self, "_on_area_enter")
	pass

func _process(delta):
	
	translate(velocity*delta)
	
	if get_position().y-16 >= get_viewport_rect().size.y:
		queue_free()
	pass
	
func set_armour(new):
	armour = new
	if armour<=0:
		utils.find_node("tex_score").score+=5
		queue_free()
	pass

func _on_area_enter(other):
	if(other.is_in_group("ship")):
		other.armour-=1
		queue_free()
	pass
