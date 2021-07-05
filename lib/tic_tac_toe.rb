class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
      ]
  
  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end
 
 def input_to_index(user_input)
   user_input.to_i - 1 
end

def move(index, player = "X")
  @board[index] = player
end

def position_taken?(index)
  if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
    return false
  else
    return true
  end
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    return true
  else false
  end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index) && current_player == "X"
    move(index, player = "X")
    display_board
    elsif valid_move?(index) && current_player == "O"
    move(index, player = "O")
    display_board
  else
    turn
  end
end

def turn_count
  counter = 0 
  @board.each do |space|
    if space == "X" || space == "O"
      counter += 1 
    end
  end
  counter
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |index|
    @board[index[0]] == @board[index[1]] && @board[index[1]] == @board[index[2]] && position_taken?(index[0])
  end
end

def full?
  @board.all?{|token| token == "X" || token == "O"}
end

def draw?
  full? && !won?
end

def over?
  won? || draw? || full?
end

def winner
  if won?
    return @board[won?[0]]
  end
end

def play
  until over?
  turn
end
if won?
  winner == "X" || winner == "O"
  puts "Congratulations #{winner}!"
  elsif draw?
  puts "Cat's Game!"
end
end

end
