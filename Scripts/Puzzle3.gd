extends PanelContainer

signal button_1_pressed
signal button_2_pressed
signal button_3_pressed
signal button_4_pressed
signal puzzle_canceled


func _unhandled_key_input(event):
	if event.is_action_released("ui_cancel"):
		emit_signal("puzzle_canceled")


func _on_Button1_pressed():
	emit_signal("button_1_pressed")


func _on_Button2_pressed():
	emit_signal("button_2_pressed")

func _on_Button3_pressed():
	emit_signal("button_3_pressed")


func _on_Button4_pressed():
	emit_signal("button_4_pressed")
