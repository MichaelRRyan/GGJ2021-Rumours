extends Panel

export var title : String
export var description : String


func _ready():
	$DialogTitle.text = title
	$ErrorText.text = description


func set_text(_title, _description):
	$DialogTitle.text = _title
	$ErrorText.text = _description


func _on_OKButton_pressed():
	hide()
