extends Node2D

var is_paused 
@onready var ball = $character

func _ready():
	SceneInfo.on_new_scene()
	is_paused = SceneInfo.is_paused	
	ball.get_tree().paused=SceneInfo.is_paused 

func _process(_delta):
	if is_paused != SceneInfo.is_paused:
		is_paused = SceneInfo.is_paused
		ball.get_tree().paused=SceneInfo.is_paused 




