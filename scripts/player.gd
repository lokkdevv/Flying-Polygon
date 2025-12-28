extends CharacterBody2D

var jumpForce = -370
var gravity = 1100

func _process(delta: float) -> void:
		if GameManager.Dead:
			freezePlayer()
'''
func _draw() -> void:
	draw_circle($Sprite2D.global_position, 10, Color.AQUA, true, 1, true)'''

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = jumpForce  
	
	move_and_slide()

func setPlayerGravity(Gravity):
	gravity = Gravity

func setPlayerJumpForce(JumpForce):
	jumpForce = JumpForce

func setPlayerVelocity(X, Y):
	velocity = Vector2(X, Y)

func freezePlayer():
	setPlayerGravity(0)
	setPlayerJumpForce(0)
	setPlayerVelocity(0, 0)
