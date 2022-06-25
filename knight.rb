class Knight
  attr_accessor :position, :moves

  def initialize(position, gameboard)
    @position = position
    calculate_possible_moves(gameboard)
  end

  # Computes and returns array of all possible moves given a gameboard
  def calculate_possible_moves(gameboard)
    tmp = []
    knight_movement.each do |move|
      new_position = [position[0] + move[0], position[1] + move[1]]
      tmp << new_position unless gameboard.out_of_bounds?(new_position)
    end

    @moves = tmp
  end

  private

  def knight_movement
    [
      [-1, -2],
      [-2, -1],
      [-1, 2],
      [-2, 1],
      [1, -2],
      [2, -1],
      [1, 2],
      [2, 1]
    ]
  end
end