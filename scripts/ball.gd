extends RigidBody2D

@onready var rayCast = $RayCast2D

var is_started = false

func _process(_delta):
	if rayCast.is_colliding():
		is_started=true

func _physics_process(delta):
	if(rayCast.is_colliding()):
		if Input.is_action_just_pressed("jump") :
			apply_central_impulse(Vector2(0,-1000))

		if linear_velocity.x < 750:
			apply_central_impulse(Vector2(200,0))

		if linear_velocity.x > 2000:
			apply_central_impulse(Vector2(-200,0))

	if Input.is_action_just_pressed("boost") and linear_velocity.x < 1500 :
		apply_central_impulse(Vector2(500,0))
		print("boost")

	elif Input.is_action_just_pressed("breake") and linear_velocity.x > 750 :
		apply_central_impulse(Vector2(-750,0))
		print("breake")













