class_name OrgansRow
extends Node2D

@export_enum("nose", "head", "mounth","ear","eye") var group: String
@export var min_poss : int = 0
@export var max_poss  : int= 1000
@export var change_value = 10
@export var organ_count : int = 5
@export var organ_distance : int = 50

@export var sprite_arrays : Array[Texture2D]=[]
@export var audio_array : Array[AudioStreamWAV]=[]

var base_organ = preload("res://component/face/organ.tscn")


var is_down = true
var poss : = int((max_poss - min_poss)/2)

var exist_organ_number = 0

func _ready():
	for n in range(organ_count):
		add_organ()

func _process(delta):
	if is_down :
		if poss < max_poss:
			poss += change_value
			position.y += change_value
		else: 
			is_down  = not is_down
	else :
		if poss > min_poss:
			poss -= change_value
			position.y -= change_value
		else: 
			is_down  = not is_down

func add_organ():
	var rng = RandomNumberGenerator.new()

	var new_organ = base_organ.instantiate()
	new_organ.group=group

	if (exist_organ_number%2) == 0: 
		exist_organ_number += 1
		new_organ.position.y = -(exist_organ_number*organ_distance)
	else:
		exist_organ_number += 1
		new_organ.position.y = (exist_organ_number*organ_distance)

	## add pic
	if not sprite_arrays.size()==0:
		var random_sprite_index = rng.randi_range(0, sprite_arrays.size()-1)
		var sprite= Sprite2D.new()
		new_organ.pic=sprite_arrays[random_sprite_index]
		sprite.texture=sprite_arrays[random_sprite_index]
		new_organ.add_child(sprite)

	#add audio
	if not audio_array.size()==0:
		var random_audio_index = rng.randi_range(0, audio_array.size()-1)
		new_organ.audio=audio_array[random_audio_index]
 
	call_deferred("add_child",new_organ)
