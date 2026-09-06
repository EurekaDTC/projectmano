extends Node2D

@export var npc_name: String = "NPC"
@export var dialogue_lines: Array[String] = []

@onready var interact_area: Area2D = $InteractArea
@onready var dialogue_box = get_tree().current_scene.get_node("Dialoguebox")

var player_inside := false
var talking := false


func _ready():
	# Make sure the Area2D exists
	if interact_area == null:
		push_error("NPC: InteractArea not found!")
		return

	interact_area.body_entered.connect(_on_body_entered)
	interact_area.body_exited.connect(_on_body_exited)


func _on_body_entered(body):
	if body.name == "player2":
		player_inside = true
		
		if not talking:
			talk()


func _on_body_exited(body):
	if body.name == "player2":
		player_inside = false


func talk():
	if dialogue_box == null:
		push_error("NPC: Dialoguebox not found!")
		return

	if dialogue_lines.is_empty():
		push_warning("NPC: No dialogue lines assigned!")
		return

	talking = true

	var lines := []

	for line in dialogue_lines:
		lines.append({
			"name": npc_name,
			"text": line
		})

	dialogue_box.start_dialogue(lines)

	await dialogue_box.dialogue_finished

	talking = false
