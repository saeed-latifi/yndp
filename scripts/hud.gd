extends CanvasLayer


func _on_setting_button_pressed():
	if not (SceneInfo.is_win or SceneInfo.is_lose):
		SceneInfo.is_paused = !SceneInfo.is_paused


