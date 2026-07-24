extends Node2D

const GRID_WIDTH := 7
const GRID_HEIGHT := 5
const NUM_ROW_BUTTONS := 5   # left buttons
const NUM_COL_BUTTONS := 7   # bottom buttons

# Button bulb masks
# read the README for more info
# length must == GRID_WIDTH (7).
const ROW_BUTTON_MASKS := [
	[1, 0, 1, 1, 0, 1, 0],  # row button 0
	[1, 1, 1, 1, 1, 1, 1],  # row button 1
	[0, 1, 0, 1, 0, 1, 0],  # row button 2
	[1, 1, 0, 0, 1, 1, 0],  # row button 3
	[0, 0, 1, 0, 0, 1, 1],  # row button 4
]

# length must == GRID_HEIGHT (5).
const COL_BUTTON_MASKS := [
	[1, 0, 1, 0, 1],  # col button 0
	[1, 1, 1, 1, 1],  # col button 1
	[0, 1, 0, 1, 0],  # col button 2
	[1, 1, 0, 0, 1],  # col button 3
	[0, 0, 1, 1, 0],  # col button 4
	[1, 0, 0, 1, 1],  # col button 5
	[0, 1, 1, 0, 1],  # col button 6
]

@onready var bulbs_container: Node2D = $Bulbs
@onready var buttons_container: Node2D = $Buttons

var bulbs: Array[Node] = []
var buttons: Array[Node] = []


signal puzzle_solved_WIN

func _check_win() -> void:
	for b in bulbs:
		if not b.is_on:
			return
	puzzle_solved_WIN.emit()
	print('won???')


func _ready() -> void:
	# get bulb and button nodes into arrays
	bulbs = bulbs_container.get_children()
	buttons = buttons_container.get_children()

	# do some asserts to make sure all info is entered correctly
	assert(bulbs.size() == GRID_WIDTH * GRID_HEIGHT, "Bulbs count doesn't match grid size")
	assert(buttons.size() == NUM_ROW_BUTTONS + NUM_COL_BUTTONS, "Button count doesn't match expected row+col buttons")
	assert(ROW_BUTTON_MASKS.size() == NUM_ROW_BUTTONS, "ROW_BUTTON_MASKS size mismatch")
	assert(COL_BUTTON_MASKS.size() == NUM_COL_BUTTONS, "COL_BUTTON_MASKS size mismatch")
	
	for mask in ROW_BUTTON_MASKS:
		assert(mask.size() == GRID_WIDTH, "row mask has the wrong length")
	for mask in COL_BUTTON_MASKS:
		assert(mask.size() == GRID_HEIGHT, "col mask has the wrong length")

	# asserts done ^_^

	for i in buttons.size():
		# add signals to buttons (couldnt be bothered to do this manually)
		# also add in button index fo references
		var btn = buttons[i]
		btn.pressed.connect(_on_button_pressed.bind(i))


func _on_button_pressed(button_index: int) -> void:
	if button_index < NUM_ROW_BUTTONS:
		# row button
		var row := button_index
		_xor_row(row, ROW_BUTTON_MASKS[row])
		
	else:
		# column button
		var col := button_index - NUM_ROW_BUTTONS
		_xor_column(col, COL_BUTTON_MASKS[col])


func _xor_row(row: int, mask: Array) -> void:
	for col in GRID_WIDTH:
		if mask[col] == 1:
			var i := row * GRID_WIDTH + col
			bulbs[i].toggle()
	_check_win()

func _xor_column(col: int, mask: Array) -> void:
	for row in GRID_HEIGHT:
		if mask[row] == 1:
			var i := row * GRID_WIDTH + col
			bulbs[i].toggle()
	_check_win()
