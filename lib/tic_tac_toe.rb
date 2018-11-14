class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [6,4,2],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end
  def display_board
    @board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input)
    @user_input = user_input.to_i - 1
  end
  def move(index, token)
    @board[index] = token
  end
  def position_taken?(index)
  if @board[index] != "X" && @board[index] != "O"
  return false
else
  return true
  end
end
def valid_move?(index)
  if !position_taken?(index) && index.between?(0,8)
    return true
  else
    return false
end
end
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  input = input_to_index(user_input)
  if valid_move?(index,token)
    move
    display_board
  else
    turn(board)
end
end

def turn_count
  counter = 0
  while counter < 9 do
    turn
  end
  end
end
   
