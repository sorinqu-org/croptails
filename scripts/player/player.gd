class_name Player
extends CharacterBody2D

@export var current_tool: Tools = Tools.None

@warning_ignore("unused_signal")
signal update_tool

enum Tools {
	None,
	Axe,
	Hoe,
	WateringCan,
	Corn,
	Tomato
}
