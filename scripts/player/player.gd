class_name Player
extends CharacterBody2D

@export var current_tool: Tools = Tools.None
signal update_tool

enum Tools {
	None,
	Axe,
	Pickaxe,
	Hoe,
	WateringCan
}
