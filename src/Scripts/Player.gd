extends KinematicBody2D

var speed = 100

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed("cima"):
		velocity.y -= speed
	
	if Input.is_action_pressed("baixo"):
		velocity.y += speed
	
	if Input.is_action_pressed("esquerda"):
		velocity.x -= speed
	
	if Input.is_action_pressed("direita"):
		velocity.x += speed
		
	move_and_slide(velocity)
