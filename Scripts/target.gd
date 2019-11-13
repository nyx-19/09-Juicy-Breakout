extends StaticBody2D

var red2 = preload("res://Assets/target_red2_outline.png")
var red1 = preload("res://Assets/target_red1_outline.png")
var white = preload("res://Assets/target_white_outline.png")
var colored = preload("res://Assets/target_colored.png")


onready var sprite = get_node("Sprite")
var score = 10
onready var _target = position

func _ready():
   position.y = -30
   $Tween.interpolate_property(self, "position", position, _target, 2.0, Tween.TRANS_ELASTIC , Tween.EASE_OUT)
   $Tween.start()
   if get_parent().name == "Red2 Targets":
       sprite.set_texture(red2)
   if get_parent().name == "Red1 Targets":
       sprite.set_texture(red1)
       score = 20
   if get_parent().name == "White Targets":
       sprite.set_texture(white)
       score = 30
   if get_parent().name == "Color Targets":
       sprite.set_texture(colored)
       score = 40
   
