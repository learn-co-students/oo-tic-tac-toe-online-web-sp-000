class TicTacToe

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


def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(index, character)
  @board[index] = character
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
if index.between?(0, 8) && !position_taken?(index)
  return true
else
  return false
end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
   if valid_move?(index)
     move(index, current_player)
     display_board
     else
       turn
   end
end

def won?
 WIN_COMBINATIONS.find do |win_combination|
if (@board[win_combination[0]]) == "X" &&
   (@board[win_combination[1]]) == "X" &&
   (@board[win_combination[2]]) == "X"
   return win_combination
 elsif
   (@board[win_combination[0]]) == "O" &&
   (@board[win_combination[1]]) == "O" &&
   (@board[win_combination[2]]) == "O"
   return win_combination
 end
 false
end
end

def full?
  @board.all? {|i| i == "X" || i == "O"}
end

def draw?
  if !won? && full?
    return true
  elsif !won?
    return false
  else
    won?
    return false
  end
end

def over?
  if won? || full?
    return true
  else
    return false
  end
end

def winner
   if won?
      return @board[won?[0]]
   end
end

def play
  until over? || draw?
    turn
  end
  if won?
    winner == "X" || winner == "O"
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat\'s Game!"
  end
end

end
