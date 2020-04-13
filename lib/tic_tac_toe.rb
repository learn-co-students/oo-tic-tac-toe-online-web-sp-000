class TicTacToe
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
    
  def initialize(board = nil)
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    # @board = board || Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input = user_input.to_i - 1
      return user_input
  end
  
  def move(index, character)
    @board[index] = character
  end
  
  def position_taken?(index)
    game = TicTacToe.new
    game.move(0, "X")
    game.move(4, "O")
  end
  
  def position_taken?(board, index)
    if @board[index] == " "
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
  def valid_move?(board, index)
    if index.between?(0,8) && !position_taken?(board, index)
      return true
    else
      return false
    end
  end
  
end


# game = TicTacToe.new
# puts game.instance_variable_get(:@board)
