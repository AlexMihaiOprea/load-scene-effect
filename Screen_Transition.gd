tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("ScreenTransition","Node2D",
	preload("res://addons/ScreenTransitons/Effect.gd"),
	preload("res://addons/ScreenTransitons/icon.png"))
	
	
func _exit_tree():
	remove_custom_type("ScreenTransition")
