extends Node

@onready var game_progress   = SceneInfo.game_progress
const first_level = "res://scenes/levels/first_level.tscn"

func _on_start_pressed():
	if SceneInfo.game_progress.guide_viewed:
		get_tree().change_scene_to_file(first_level)

func _on_exit_pressed():
	get_tree().quit()

func _on_re_start_pressed():	
	get_tree().change_scene_to_file(first_level)
