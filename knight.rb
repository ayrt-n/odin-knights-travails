class Knight
  attr_reader :position, :moves

  def initialize(position, gameboard)
    @position = position
    @moves = possible_moves(gameboard)
  end

  private

  def possible_moves(gameboard)
    tmp = []
    knight_movement.each do |move|
      new_position = [position[0] + move[0], position[1] + move[1]]
      tmp << new_position unless gameboard.out_of_bounds?(new_position)
    end
    tmp
  end

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