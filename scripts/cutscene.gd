extends CanvasLayer

signal cutscene_finished

@onready var image_rect = $TextureRect
@onready var dialogue_box = $"../Dialougebox"

var steps: Array = []
var current_step := 0


func _ready():
	visible = false


func start_cutscene(new_steps: Array):
	steps = new_steps
	current_step = 0
	visible = true

	show_step()


func show_step():

	if current_step >= steps.size():
		visible = false
		cutscene_finished.emit()
		return

	var step = steps[current_step]

	# Change image
	image_rect.texture = step.get("image", null)

	# Show dialogue using existing dialogue system
	dialogue_box.start_dialogue([
		{
			"name": step.get("name", ""),
			"text": step.get("text", "")
		}
	])

	# Wait for dialogue to finish
	await dialogue_box.dialogue_finished

	current_step += 1
	show_step()
