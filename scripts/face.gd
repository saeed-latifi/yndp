extends Node2D

@onready var audio_player =$AudioStreamPlayer2D

var head_count = 0
var mounth_count = 0
var nose_count = 0
var eye_count = 0
var era_count= 0
var sibil_count= 0
var hair_count= 0

func _process(delta):
	if SceneInfo.is_win :
		rotation_degrees = 0
	else:
		rotation_degrees += 5

func _on_organs(area):
	if area.is_in_group("organ"):

		audio_player.stream = area.audio
		audio_player.play()

		if area.is_in_group("head") :
			add_head(area.pic)

		if area.is_in_group("nose") :
			add_nose(area.pic)

		if area.is_in_group("mounth") :
			add_mounth(area.pic)

		if area.is_in_group("eye"):
			add_eye(area.pic)

		if area.is_in_group("ear"):
			add_ear(area.pic)

		if area.is_in_group("hair"):
			add_hair(area.pic)

		if area.is_in_group("sibil"):
			add_sibil(area.pic)

func add_head(texture:Texture2D):
	if not head_count == 0:
		return

	var head = Sprite2D.new()
	head.texture=texture
	head_count += 1
	add_child(head)

func add_eye(texture:Texture2D):
	if eye_count > 1:
		return

	var eye = Sprite2D.new()
	eye.texture=texture
	eye.position.y -= 50
	
	if eye_count == 0:		
		eye.position.x += 50

	elif eye_count==1:
		eye.flip_h=true
		eye.position.x -= 50

	eye_count += 1
	add_child(eye)

func add_ear(texture:Texture2D):
	if era_count > 1:
		return

	var ear = Sprite2D.new()
	ear.texture=texture
	ear.position.y -= 60
	
	if era_count == 0:
		ear.position.x += 100

	elif era_count==1:
		ear.flip_h=true
		ear.position.x -= 90

	era_count += 1
	add_child(ear)

func add_nose(texture:Texture2D):
	if not nose_count == 0:
		return
		
	print("add nose")
	var nose = Sprite2D.new()
	nose.texture=texture
	nose_count += 1
	add_child(nose)

func add_mounth(texture:Texture2D):
	if not mounth_count == 0:
		return

	var mounth = Sprite2D.new()
	mounth.position.y = 70
	mounth.texture=texture
	mounth_count += 1
	add_child(mounth)

func add_sibil(texture:Texture2D):
	if not sibil_count == 0:
		return

	var sibil = Sprite2D.new()
	sibil.position.y = 20
	sibil.texture=texture
	sibil_count += 1
	add_child(sibil)

func add_hair(texture:Texture2D):
	if not hair_count == 0:
		return

	var hair = Sprite2D.new()	
	hair.texture=texture
	hair_count += 1
	add_child(hair)
