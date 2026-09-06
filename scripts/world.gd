extends Node2D

@onready var cutscene = $Cutscene


func _ready():
	start_intro()


func start_intro():

	cutscene.start_cutscene([
		{
			"image": preload("res://art/cutscenes/panel1.png"),
			"name": "",
			"text": "The city of Madurai..."
	
		},

		{
			"image": preload("res://art/cutscenes/panel2.png"),
			"name": "",
			"text": "Ruled by Jeevakan, the weak Pandya King..."
		},

		{
			"image": preload("res://art/cutscenes/panel2.png"),
			"name": "",
			"text": "Under the spiritual guidance of sage Sundara."
		},

		{
			"image": preload("res://art/cutscenes/panel3.png"),
			"name": "",
			"text": "Manonmani."
		},

		{
			"image": preload("res://art/cutscenes/panel3.png"),
			"name": "",
			"text": "Jeevakan's only daughter."
		},
		{
			"image": preload("res://art/cutscenes/panel4.png"),
			"name": "",
			"text": "Caught up in the webs of political betrayals and noxious personal affairs."
		},
		{
			"image": null,
			"name": "",
			"text": "Shall the princess stay in the webs of her castle or she’ll have the glory of freedom and Eleutheromania."
		},
		{
			"image": null,
			"name": "",
			"text": "It’s up to YOU, the fate."
		},
		{
			"image": null,
			"name": "",
			"text": "Let the tale get unfold…"
		}
		
	])
