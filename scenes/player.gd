extends Area2D

@onready var player_lazer_scene = preload("res://scenes/player_lazer.tscn")
@export var speed:int = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("player_down"):
		position.y += speed
	elif Input.is_action_pressed("player_left"):
		position.x -= speed
	elif Input.is_action_pressed("player_right"):
		position.x += speed
	elif Input.is_action_pressed("player_up"):
		position.y -= speed


	position.x  = clampi(position.x, 19, 1133)
	position.y = clampi(position.y, 25, 624)



	if Input.is_action_just_pressed("player_fire"):
		var player_lazer = player_lazer_scene. instantiate()
		player_lazer.position = position
		get_parent().add_child(player_lazer)
