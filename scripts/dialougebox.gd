extends CanvasLayer

signal dialogue_finished

@onready var name_label: Label = $Panel/NameLabel
@onready var dialogue_label: Label = $Panel/DialougeLabel
@onready var next_button: Button = $Panel/NextButton

var lines: Array[Dictionary] = []
var current_line: int = 0
var typing := false
var current_tween: Tween


func _ready() -> void:
	visible = false
	next_button.pressed.connect(_on_next_pressed)


func start_dialogue(new_lines: Array) -> void:
	if new_lines.is_empty():
		push_warning("Dialoguebox: No dialogue lines received!")
		return

	lines.clear()

	for line in new_lines:
		lines.append(line)

	current_line = 0
	visible = true

	show_line()


func show_line() -> void:
	if current_line >= lines.size():
		end_dialogue()
		return

	# Kill previous typewriter animation
	if current_tween and current_tween.is_valid():
		current_tween.kill()

	name_label.text = str(lines[current_line].get("name", ""))
	dialogue_label.text = str(lines[current_line].get("text", ""))

	dialogue_label.visible_characters = 0
	typing = true

	var text_length := dialogue_label.text.length()

	current_tween = create_tween()

	if text_length > 0:
		current_tween.tween_property(
			dialogue_label,
			"visible_characters",
			text_length,
			text_length * 0.025
		)

		current_tween.finished.connect(_on_typing_finished)
	else:
		_on_typing_finished()


func _on_typing_finished() -> void:
	typing = false
	dialogue_label.visible_characters = -1


func _on_next_pressed() -> void:
	# If text is still typing, instantly finish it
	if typing:
		if current_tween and current_tween.is_valid():
			current_tween.kill()

		dialogue_label.visible_characters = -1
		typing = false
		return

	# Otherwise go to next line
	current_line += 1
	show_line()


func end_dialogue() -> void:
	visible = false
	typing = false
	dialogue_finished.emit()
