extends Control


export var size = 4
export var tile_size = 80
export var tile_scene: PackedScene
export var slide_duration = 0.15

var board = []
var tiles = []
var empty = Vector2()
var is_animating = false
var tiles_animating = 0

var move_count= 0
var number_visible = true
var background_texture = null

enum GAME_STATES {
	NOT_STARTED,
	STARTED,
	WON
}

var game_state = GAME_STATES.NOT_STARTED

signal game_started
signal game_won
signal moves_updated

func gen_board():
	var value = 1
	board = []
	
	for r in range(size):
		board.append([])
		for c in range(size):
			
			if (value == size*size):
				board[r].append(0)
				empty = Vector2(c, r)
			else:
				board[r].append(value)
				
				var tile = tile_scene.instance()
				tile.set_position(Vector2(c * tile_size, r * tile_size))
				tile.set_text(value)
				if background_texture:
					tile.set_sprite_texture(background_texture)
				tile.set_sprite(value-1, size, tile_size)
				tile.set_number_visible(number_visible)
				tile.connect("tile_pressed", self, "_on_Tile_pressed")
				tile.connect("slide_completed", self, "on_Tile_slide_completed")
				add_child(tile)
				tiles.append(tile)
			value += 1


func is_board_solved():
	var count = 1
	for r in range(size):
		for c in range(size):
			if (board[r][c] != count):
				if r == c and c == size - 1 and board[r][c] == 0:
					return true
				else:
					return false
			count += 1
	return true
	

func print_board():
	print("---- M E S A ----")
	for r in range(size):
		var row = ''
		for c in range(size):
			row += str(board[r][c]).pad_zeros(2) + ' '
			print(row)

func value_to_grid(value):
	for r in range(size):
		for c in range(size):
			if (board[r][c] == value):
				return Vector2(c, r)
	return null
	


func get_title_by_value(value):
	for tile in tiles:
		if str(tile.number) == str(value):
			return tile
	return null


func _ready():
	tile_size = floor(get_size().x / size)
	set_size(Vector2(tile_size*size, tile_size*size))
	gen_board()


func _on_Tile_pressed(number):
	if is_animating:
		return
	
	if game_state == GAME_STATES.NOT_STARTED:
		scramble_board()
		game_state = GAME_STATES.STARTED
		emit_signal("game_started")
		return
		
	if game_state == GAME_STATES.WON:
		game_state = GAME_STATES.STARTED
		reset_move_count()
		scramble_board()
		emit_signal("game_started")
		return
		
	var tile = value_to_grid(number)
	empty = value_to_grid(0)
	
	if(tile.x != empty.x and tile.x != empty.y):
		return
	
	var dir = Vector2(sign(tile.x - empty.x), sign(tile.y - empty.y))
	var start = Vector2(min(tile.x, empty.x), min(tile.y, empty.y))


func is_board_solvable(flat):
	pass


func scramble_board():
	pass