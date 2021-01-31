extends Panel

signal confirm_pressed
signal back_pressed

export var dialog_name : String
export var placeholder_text : String
export var text_limit : int
export var cancel_option : bool


func _ready():
	$DialogTitle.text = dialog_name
	$Input.placeholder_text = placeholder_text
	$Input.max_length = text_limit
	
	if !cancel_option:
		$HBoxContainer/Back.hide()
	

func _on_Back_pressed():
	$Input.clear()
	$ErrorText.hide()
	hide()
	emit_signal("back_pressed")


func _on_Confirm_pressed():
	emit_signal("confirm_pressed")


func get_input():
	return $Input.text


func display_error(error_text):
	$ErrorText.text = error_text
	$ErrorText.show()
