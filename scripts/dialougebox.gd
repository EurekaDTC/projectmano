extends CanvasLayer

signal dialogue_finished

@onready var name_label = $Panel/NameLabel
@onready var dialogue_label = $Panel/DialougeLabel
@onready var next_button = $Panel/NextButton

var lines: Array = []
var current_line := 0


func _ready():
	visible = false
	next_button.pressed.connect(_on_next_pressed)


func start_dialogue(new_lines: Array):
	lines = new_lines
	current_line = 0
	visible = true
	show_line()


func show_line():
	if current_line >= lines.size():
		visible = false
		dialogue_finished.emit()
		return

	name_label.text = lines[current_line]["name"]

	dialogue_label.text = lines[current_line]["text"]
	dialogue_label.visible_characters = 0

	var text_length = dialogue_label.text.length()

	var tween = create_tween()
	tween.tween_property(
		dialogue_label,
		"visible_characters",
		text_length,
		text_length * 0.025
	)

func _on_next_pressed():
	current_line += 1
	show_line()
