extends Area2D

@onready var cutscene = get_tree().current_scene.get_node("Cutscene")

var triggered := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body) -> void:
	if body.name == "player2" and not triggered:
		triggered = true
		start_jaali_cutscene()


func start_jaali_cutscene() -> void:
	cutscene.start_cutscene([
		{
			"image": preload("res://art/cutscenes/panel1.png"),
			"name": "Minister's Son",
			"text": "The king is old and has no son. Who do you think will succeed him, father?"
		},
		{
			"image": preload("res://art/cutscenes/panel2.png"),
			"name": "Minister",
			"text": "The man who marries the princess will be the next king."
		},
		{
			"image": preload("res://art/cutscenes/panel3.png"),
			"name": "Minister's Son",
			"text": "Father, with your influence over the king, I could easily be that man..."
		},
		{
			"image": preload("res://art/cutscenes/panel4.png"),
			"name": "Minister",
			"text": "Not that the idea hasn't occurred to me."
		}
	])
