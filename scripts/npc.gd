extends Node2D

@export var npc_name: String = "NPC"
@export var dialogue_lines: Array[String] = []

@onready var interact_area: Area2D = $InteractArea
@onready var dialogue_box = get_tree().current_scene.get_node_or_null("Dialoguebox")

var player_inside := false
var talking := false


func _ready() -> void:
	if interact_area == null:
		push_error("NPC: InteractArea not found!")
		return

	interact_area.body_entered.connect(_on_body_entered)
	interact_area.body_exited.connect(_on_body_exited)


func _on_body_entered(body: Node) -> void:
	if body.name != "player2":
		return

	player_inside = true

	print("NPC: Player entered interaction area")

	if not talking:
		talk()


func _on_body_exited(body: Node) -> void:
	if body.name != "player2":
		return

	player_inside = false


func talk() -> void:
	if talking:
		return

	if dialogue_box == null:
		push_error("NPC: Dialoguebox not found!")
		return

	if dialogue_lines.is_empty():
		push_warning("NPC: No dialogue lines assigned!")
		return

	talking = true

	var lines: Array[Dictionary] = []

	for line in dialogue_lines:
		lines.append({
			"name": npc_name,
			"text": line
		})

	print("NPC: Starting dialogue")
	print(lines)

	dialogue_box.start_dialogue(lines)

	await dialogue_box.dialogue_finished

	print("NPC: Dialogue finished")

	talking = false
