class TicTacToe

WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5], #Middle row
[6, 7, 8], #Bottom row
[0, 3, 6], #Left row
[1, 4, 7], #Middle row
[2, 5, 8], #Right row
[0, 4, 8], #Left diagonal
[2, 4, 6] #Right diagonal
]

def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end


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

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(index)
  if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
  return false
else
  return true
end
end

def valid_move?(index)
  if index.between?(0,  8) && !position_taken?(index)
  return true
end
end

def turn_count
  counter = 0
  @board.each {|space|
  if space == "X" || space == "O"
      counter += 1
    end}
    counter
end

def current_player
  turn_count % 2 == 0? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
user_input = gets.strip
index = input_to_index(user_input)
if valid_move?(index)
    move(index, player = current_player)
    display_board
else
  turn
end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|

win_index_1 = win_combination[0]
win_index_2 = win_combination[1]
win_index_3 = win_combination[2]

position_1 = @board[win_index_1]
position_2 = @board[win_index_2]
position_3 = @board[win_index_3]

  if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
    return win_combination
  end
end
return false
end

def full?
  if @board.any? {|index| index == nil || index == " "}
  return false
else
return true
end
end

def draw?
  if !won? && full?
    return true
  else won?
    return false
  end
end

def over?
  if draw? || won? || full?
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
  until over?
    turn
   end
   if won?
     winner == "X" || winner == "O"
     puts "Congratulations #{winner}!"
   else
     draw?
       puts "Cat's Game!"
     end
end

end
