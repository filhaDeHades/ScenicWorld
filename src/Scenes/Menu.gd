extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_JogarBotao_pressed():
	get_tree().change_scene("res://src/Scenes/Cidade.tscn")


func _on_InstrucoesBotao_pressed():
	pass # Replace with function body.


func _on_SobreBotao_pressed():
	pass # Replace with function body.


func _on_CreditosBotao_pressed():
	pass # Replace with function body.


#Idiomas
func _on_en_pressed():
	get_tree().change_scene("res://src/Scenes/MenuEn.tscn")
