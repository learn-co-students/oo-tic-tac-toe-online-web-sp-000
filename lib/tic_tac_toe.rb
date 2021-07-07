class TicTacToe

  def initialize(board = nil)
   @board = board || Array.new(9, " ")
 end

 WIN_COMBINATIONS = [
   [0,1,2], # Top row
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
 puts   "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
 puts   "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 def input_to_index(user_input)
   user_input.to_i - 1
 end

 def move (index, current_player = "X")
   @board[index] = current_player
 end

def position_taken?(index)
  if @board[index] == "X" || @board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(index) == true
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  counter = 0
  @board.each do |move|
if move == "X" || move == "O"
    counter += 1
  end
end
counter
end

def current_player
if turn_count % 2 == 0
   "X"
else #turn_count % 2 != 0
   "O"
  end
end

def won?
WIN_COMBINATIONS.each do | win_combination |
position_1 = @board[win_combination[0]]
position_2 = @board[win_combination[1]]
position_3 = @board[win_combination[2]]

if
  position_1 == "X" && position_2 == "X" && position_3 == "X"
  return win_combination

elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
  return win_combination
  end
end
return false
end

def full?
@board.all? do |board|
board == "X" || board =="O"
end
end

def draw?
if !won? && full?
  return true
else
  return false
end
end

def over?
  if won? || full? || draw?
    true

  else
    false
  end
end


def winner
  index = won?
  if index == false
    return nil
  else
    if @board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play
while !over? == true
  turn
end

if won?
  puts "Congratulations #{winner}!"

elsif draw?
  puts "Cat's Game!"
end
end


end
