extends RigidBody2D

@onready var rayCast = $RayCast2D

var is_started = false

func _process(_delta):
	if rayCast.is_colliding():
		is_started=true

func _physics_process(delta):
	if(rayCast.is_colliding()):
		if Input.is_action_just_pressed("jump") :
			on_jump()

		if linear_velocity.x < 750:
			apply_central_impulse(Vector2(200,0))

		if linear_velocity.x > 2000:
			apply_central_impulse(Vector2(-200,0))

	if Input.is_action_just_pressed("boost") and linear_velocity.x < 1500 :
		on_boost()

	elif Input.is_action_just_pressed("brake") and linear_velocity.x > 750 :
		on_brake()


func on_boost():
	apply_central_impulse(Vector2(500,0))

func on_brake():
	apply_central_impulse(Vector2(-750,0))

func on_jump():
	apply_central_impulse(Vector2(0,-1000))


func _on_touch_brake():
	if linear_velocity.x > 750: on_brake()

func _on_touch_jump():
	if(rayCast.is_colliding()): on_jump()

func _on_touch_boost():
	if linear_velocity.x < 1500: on_boost()

