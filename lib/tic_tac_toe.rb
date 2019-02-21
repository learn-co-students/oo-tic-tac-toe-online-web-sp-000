class TicTacToe
# Creating a new board whenever game is initialized.
  def initialize
    @board = Array.new(9, " ")
  end
  
  # Defines what combinations are winning combinations
  WIN_COMBINATIONS = 
  [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]
  
  # Prints out your current board
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  # Changes user input to indexed array number
  def input_to_index(user_input)
    index = (user_input.to_i - 1)
  end
  
  # Allows user's number choice to mark the board
  def move(index, character = "X")
  if character == "X"
    @board[index] = "X"
  else character == "O"
    @board[index] = "O"
end
end

# Validation: Cannot overwrite someone else's move
def position_taken?(index)
  if @board[index] == "X"
    true
  elsif @board[index] == "O"
    true
  else
    false
  end
end

# Validation: Chose between 1-9 & position is not taken?
def valid_move?(index)
  if (index.between?(0,8) == true) && (position_taken?(index) == false)
    return true 
  else
    return false
  end
end

#Bundles current_player, input_to_index, valid_move?, move, and display_board to take a turn
def turn
  character = current_player
puts "Please enter 1-9:"
user_input = gets.strip
user_input = user_input.to_i
index = input_to_index(user_input)
 if valid_move?(index) == true
   move(index, character)
   display_board
  else 
    turn
  end
end

# Creates a loop of play until it is won or a draw
def play
turn until over?
if won?
  puts "Congratulations #{winner}!"
elsif draw? == true
  puts "Game over! Thanks for playing."
end
end

# Counts number of turns
def turn_count
  x_turns = @board.count("X")
  o_turns = @board.count("O")
  turn_count = x_turns + o_turns
  return turn_count
end
  
# Uses turn_count to determine if X or O is next 
def current_player
  turn_count 
  if turn_count%2 != 0 
    "O"
 else
    "X"
  end
end

# Checks to see if the board matches any of the winning combinations 
def won?
for sub_array in WIN_COMBINATIONS do
index_1 = sub_array[0]
index_2 = sub_array[1]
index_3 = sub_array[2]

board_index_1 = @board[index_1]
board_index_2 = @board[index_2]
board_index_3 = @board[index_3]

 if (board_index_1 == "X" && board_index_2 == "X" && board_index_3 == "X") || (board_index_1 == "O" && board_index_2 == "O" && board_index_3 == "O") 
  return sub_array
end
end
false
end

# Checks to see if there are any blank spaces left 
def full?
  if @board.include?(" " || "" || nil)
    false
  else
    true 
  end 
end

# Checks to see if it is won or full to determine a draw
def draw?
  if won?
    return false
  elsif !full?
    false 
  else
    puts "Cat's Game!"
    true
end 
end 

# Checks to see if the game is over 
def over?
 if draw? 
   return true
elsif won?
  return true 
else
  false 
end
end

# If someone won, prints the winner (X or O)
def winner
sub_array = won?
  if won? == false
    return nil
  elsif @board[sub_array[1]] == "X"
   return "X"
  elsif @board[sub_array[1]] == "O"
   return "O"
end
end

end