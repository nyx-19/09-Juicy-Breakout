extends RigidBody2D

export var maxspeed = 5000

signal lives
signal score

func _ready():
 contact_monitor = true
 set_max_contacts_reported(4)
 var WorldNode = get_node("/root/World")
 connect("score", WorldNode, "increase_score")
 connect("lives", WorldNode, "decrease_lives")

func _physics_process(delta):
 var bodies = get_colliding_bodies()
 for body in bodies:
  if body.is_in_group("Targets"):
   emit_signal("score",body.score)
   get_node("/root/World/hit").playing = true
   body.queue_free()
  if body.get_name() == "Spring":
   get_node("/root/World/bounce").playing = true
   pass
  if body.get_name() == "Wall":
   get_node("/root/World/wall").playing = true
  
 if position.y > get_viewport_rect().end.y:
  emit_signal("lives")
  queue_free()
 