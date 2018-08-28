require_relative 'piece'
require_relative 'nullpiece'

class Board  
  attr_accessor :grid 
  
  def initialize
    @grid = fill_grid
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end
  
  def fill_grid
    # first_and_end_row = ['Rook', 'Knight', 'Bishop', 'Queen','King', 'Bishop', 'Knight', 'Rook']
    result = []
    4.times do |x|
      array = []
      8.times do |y|
        array << NullPiece.new
      end
      result << array
    end
    result.unshift([Piece.new] * 8)
    result << [Piece.new] * 8
    result.unshift([Piece.new] * 8)
    result << [Piece.new] * 8
    result 
  end 
  
  def move_piece(start_pos, end_pos)
    raise ArgumentError if self[start_pos] == nil || (end_pos.first > 7 || end_pos.last > 7)
    self[end_pos], self[start_pos] =  self[start_pos], self[end_pos]
  end
  
  # def valid?(start_pos, end_pos)
  # end 
  
end

if __FILE__ == $PROGRAM_NAME
  check = Board.new
  p check.grid 
  p check.move_piece([0, 1], [2, 3])
  p check.grid 
end 
