require './game_board'

# Instantiate 8x8 board
board = GameBoard.new(8)

# Find the shortest path between two spots if they exist
board.knight_moves([3, 3], [0, 0])
puts ''
board.knight_moves([7, 7], [0, 0])
puts ''
board.knight_moves([9000, 9000], [2, 2])
