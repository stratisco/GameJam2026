extends Timer


@onready var timer_label: Label = $"../TimerLabel"

signal ten_seconds_left
var ten_second_signal_sent = false

signal one_seconds_left
var one_second_signal_sent = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var total := int(ceil(time_left))
	var minutes := total / 60
	var seconds := total % 60
	timer_label.text = "%02d:%02d" % [minutes, seconds]
	
	if time_left <= 15 and not ten_second_signal_sent:
		ten_seconds_left.emit()
		ten_second_signal_sent = true
		
	if time_left <= 2.5 and not one_second_signal_sent:
		one_seconds_left.emit()
		one_second_signal_sent = true
		
	
