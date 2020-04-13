class TicTacToe
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
    
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  
  end
end


# game = TicTacToe.new
# puts game.instance_variable_get(:@board)
