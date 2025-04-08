extends CharacterBody2D


@export var walk_speed = 420.0
@export_range(0,1) var acceleration = 0.1
@export_range(0,1) var deceleration = 0.1
@onready var _animated_sprite = $AnimatedSprite2D


func _process(_delta):
	if Input.is_action_pressed("right"):
		_animated_sprite.play("walking")
	if Input.is_action_pressed("jump"):
		_animated_sprite.play("jump")
	if Input.is_action_pressed("left"):
		_animated_sprite.play("behind")
	if Input.is_action_pressed("attack"):
		_animated_sprite.play("attack")

const JUMP_VELOCITY = -1000.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("left","right")
	if direction:
		velocity.x = direction * walk_speed
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed)

	move_and_slide()
	
