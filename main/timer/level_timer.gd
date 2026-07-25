extends Timer


@onready var timer_label: Label = $"../TimerLabel"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var total := int(ceil(time_left))
	var minutes := total / 60
	var seconds := total % 60
	timer_label.text = "%02d:%02d" % [minutes, seconds]	
	
