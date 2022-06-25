require './knight'

class GameBoard
  attr_reader :board

  def initialize(size)
    @board = Array.new(size) { Array.new(size) }
  end

  def shortest_path(start, finish, piece = Knight)
    return nil if out_of_bounds?(start) || out_of_bounds?(finish)

    queue = [{ position: start, path: [start] }]
    visited = []

    until queue.empty?
      current = queue.shift
      next if visited.include?(current[:position])
      return current[:path] if current[:position] == finish

      visited << current[:position]
      knight = piece.new(current[:position], self)
      knight.moves.each do |move|
        queue << { position: move, path: current[:path] + [move] }
      end
    end

    nil
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
p board.shortest_path([3,3], [0,0])

