extends Node2D

@onready var head = $head
@onready var mounth = $mounth
@onready var nose = $nose
@onready var eye_right = $eye_right
@onready var eye_left = $eye_left
@onready var ear_right = $ear_right
@onready var ear_left = $ear_left

@onready var audio_player =$AudioStreamPlayer2D

var have_head = 0
var have_mounth = 0
var nose_count = 0
var eye_count = 0
var have_ear= 0

func _process(delta):
	rotation_degrees+=5



func _on_organs(area):
	if area.is_in_group("organ"):



		audio_player.stream = area.audio
		audio_player.play()
		
		
		if area.is_in_group("head") and have_head ==0:
			head.texture=area.pic
			have_head += 1
			
			
		if area.is_in_group("nose") :
			add_nose(area.pic)
			
			
		if area.is_in_group("mounth") and have_mounth==0:
			have_mounth += 1
			mounth.texture=area.pic
			
			
		if area.is_in_group("eye"):
			add_eye(area.pic)
			

		if area.is_in_group("ear"):
			if have_ear ==0:
				ear_left.texture=area.pic
				have_ear += 1
			elif have_ear==1:
				ear_left.texture=area.pic
				have_ear += 1
			

func play_audio():
	pass
	

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

func add_nose(texture:Texture2D):
	if not nose_count == 0:
		return
		
	print("add nose")
	var nose = Sprite2D.new()
	nose.texture=texture
	nose_count += 1
	add_child(nose)
