class_name  YandexSdkInitializer
extends Node

@export var menu_scene: PackedScene

func _ready() -> void:
	await YandexSDK.game_ready()
	get_tree().change_scene_to_packed(menu_scene)
