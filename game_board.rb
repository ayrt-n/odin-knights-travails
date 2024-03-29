require './knight'

class GameBoard
  attr_reader :board

  def initialize(size)
    @board = Array.new(size) { Array.new(size) }
  end

  # Takes start array and finish array ([row, col]) and prints the shortest path between the two
  def knight_moves(start, finish)
    moves = shortest_path(start, finish)
    if moves.nil?
      puts 'Could not find path'
    else
      puts "You made it in #{moves.size} move(s)! Here's your path:"
      moves.each { |move| p move }
    end
  end

  # Takes start array and finish array ([row, col]) and returns array of shortest path or nil
  def shortest_path(start, finish, piece = Knight)
    return nil if out_of_bounds?(start) || out_of_bounds?(finish)

    knight = piece.new(start, self)
    queue = [{ position: start, path: [start] }]
    visited = []

    until queue.empty?
      current = queue.shift
      next if visited.include?(current[:position])
      return current[:path] if current[:position] == finish

      visited << current[:position]
      knight.position = current[:position] # Update position of the knight
      knight.calculate_possible_moves(self) # Recalculate possible moves for new position
      knight.moves.each do |move| # Add each possible move and the path to the queue
        queue << { position: move, path: current[:path] + [move] }
      end
    end

    nil
  end

  # Takes array of coordinates [row, col] and returns true if position out of board limits
  def out_of_bounds?(coordinates)
    limit = board.size - 1
    row = coordinates[0]
    col = coordinates[1]

    row > limit || col > limit || row.negative? || col.negative?
  end
end
