require './knight'

class GameBoard
  attr_reader :board

  def initialize(size)
    @board = Array.new(size) { Array.new(size) }
  end

  # Takes array of coordinates [row, col] and returns bool if position in board limits
  def out_of_bounds?(coordinates)
    limit = board.size - 1
    row = coordinates[0]
    col = coordinates[1]

    row > limit || col > limit || row.negative? || col.negative?
  end
end

board = GameBoard.new(8)
puts board.out_of_bounds?([0, 0])
puts board.out_of_bounds?([3, 3])
puts board.out_of_bounds?([-1, 2])
puts board.out_of_bounds?([-1, -2])
puts board.out_of_bounds?([4, 4])

knight = Knight.new([2, 2], board)
p knight.moves
