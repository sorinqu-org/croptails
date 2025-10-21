class_name  YandexSdkInitializer
extends Node

@export var menu_scene: PackedScene

func _ready() -> void:	

	await YandexSDK.game_ready()	
	print("Yandex SDK successfully initialized!")
	
	await get_tree().create_timer(1).timeout
	get_tree().call_deferred("change_scene_to_packed", menu_scene)
	YandexSDK.gameplay_started()
	queue_free()
