extends CharacterBody2D
@export var  speed: int = 50
@onready var animations  = $AnimationPlayer
func moveDirection() : 
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down",)
	velocity = direction * speed
func updateAnimation():
	var direction = "Down"
	if velocity.x < 0: direction = "Left"
	elif velocity.x > 0: direction = "Right"
	elif velocity.y < 0: direction = "Up"
	if velocity.length() == 0:
		animations.play("idle" + direction)
	else:
		animations.play("walk" + direction)


func _physics_process(delta):
	moveDirection()
	move_and_slide()
