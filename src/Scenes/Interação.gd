extends Node2D

export var timeline = "Placeholder"

signal interacao_ativada


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_Area2D_body_entered")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Area2D_body_entered(body):
	print('entrou')
	var dialog = Dialogic.start(timeline)
	add_child(dialog)
	emit_signal("interacao_ativada")
