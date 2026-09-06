extends Area2D

var triggered := false


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player2" and not triggered:
		triggered = true
		start_transition()


func start_transition() -> void:
	# Create fullscreen transition layer
	var canvas := CanvasLayer.new()
	canvas.layer = 100
	get_tree().current_scene.add_child(canvas)

	# Black screen
	var black := ColorRect.new()
	black.color = Color.BLACK
	black.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	black.modulate.a = 0.0
	canvas.add_child(black)

	# Fade to black
	var tween := create_tween()
	tween.tween_property(black, "modulate:a", 1.0, 0.6)

	await tween.finished

	# Change to forest
	get_tree().change_scene_to_file("res://scenes/forest.tscn")
