extends CharacterBody2D

@export var speed: float = 40.0
@export var roam_distance: float = 100.0
@export var min_walk_time: float = 1.0
@export var max_walk_time: float = 3.0
@export var min_idle_time: float = 1.0
@export var max_idle_time: float = 3.0

var current_dir := "down"
var start_position: Vector2
var walking := false


func _ready() -> void:
	start_position = global_position
	roam()


func _physics_process(_delta: float) -> void:
	if walking:
		move_and_slide()


func roam() -> void:
	while true:
		# Stand still for a while
		walking = false
		velocity = Vector2.ZERO
		play_anim(0)

		await get_tree().create_timer(
			randf_range(min_idle_time, max_idle_time)
		).timeout

		# Pick a random direction
		var direction := Vector2(
			randi_range(-1, 1),
			randi_range(-1, 1)
		)

		# Don't allow no direction
		if direction == Vector2.ZERO:
			direction = Vector2.DOWN

		direction = direction.normalized()

		# Make sure it doesn't wander too far from its starting point
		var target := global_position + direction * randf_range(30.0, roam_distance)

		if target.distance_to(start_position) > roam_distance:
			target = start_position

		var distance := global_position.distance_to(target)
		var walk_time := distance / speed

		current_dir = get_direction_name(direction)

		walking = true
		play_anim(1)

		var elapsed := 0.0

		while elapsed < walk_time:
			var movement_direction := global_position.direction_to(target)

			velocity = movement_direction * speed

			current_dir = get_direction_name(movement_direction)
			play_anim(1)

			elapsed += get_process_delta_time()
			await get_tree().process_frame

		velocity = Vector2.ZERO
		walking = false


func get_direction_name(direction: Vector2) -> String:
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			return "right"
		else:
			return "left"
	else:
		if direction.y > 0:
			return "down"
		else:
			return "up"


func play_anim(movement: int) -> void:
	var anim = $AnimatedSprite2D

	if current_dir == "right":
		anim.flip_h = false

		if movement == 1:
			anim.play("side_walk")
		else:
			anim.play("side_idle")

	elif current_dir == "left":
		anim.flip_h = true

		if movement == 1:
			anim.play("side_walk")
		else:
			anim.play("side_idle")

	elif current_dir == "up":
		anim.flip_h = false

		if movement == 1:
			anim.play("back_walk")
		else:
			anim.play("back_idle")

	elif current_dir == "down":
		anim.flip_h = false

		if movement == 1:
			anim.play("front_walk")
		else:
			anim.play("front_idle")
