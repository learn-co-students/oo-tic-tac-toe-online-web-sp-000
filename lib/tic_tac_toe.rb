class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS =
  [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

  def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n
        #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n
        #{@board[6]} | #{@board[7]} | #{@board[8]} "
return " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n
        #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n
        #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
      return index = input.to_i - 1
  end

  def move(board, input, value)
    board[input] = value
  end

end
