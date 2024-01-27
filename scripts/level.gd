extends Node2D

var is_paused 
@onready var ball = $character
@onready var camera =$character/Camera2D

@onready var music = $AudioStreamPlayer2D

func _ready():
	SceneInfo.on_new_scene()
	is_paused = SceneInfo.is_paused	
	ball.get_tree().paused=SceneInfo.is_paused 

func _process(_delta):
	if is_paused != SceneInfo.is_paused:
		is_paused = SceneInfo.is_paused
		ball.get_tree().paused=SceneInfo.is_paused 
		$HUD.visible= not SceneInfo.is_win

func _on_win(body):
	SceneInfo.is_win = true
	camera.zoom.x = 2.5
	camera.zoom.y = 2.5

