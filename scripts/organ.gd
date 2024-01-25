class_name Organ
extends Area2D

var group: String
@export var pic : Texture2D
@export var audio : AudioStreamWAV

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(group)
	#var collision = CollisionShape2D.new()
	#var shape = CircleShape2D.new()
	#shape.radius = 15
	#collision.shape=shape
	#call_deferred("add_child",collision)
