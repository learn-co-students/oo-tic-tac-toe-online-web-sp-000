class TicTacToe

def initialize
@board = Array.new(9, " ")
end

 WIN_COMBINATIONS = [
   [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,4,6],
  [0,4,8],
  [0,3,6],
  [2,5,8],
  [1,4,7],
 ]

 def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 def input_to_index (input)
   return input.to_i - 1
 end

 def move ( index, value)
 @board[index]=value
 end

 def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

 def valid_move?(index)
   index.between?(0,8) && !position_taken?( index)
 end

 def turn_count
   counter = 0
   @board.each do |space|
     if space == "X" || space == "O"
       counter += 1
     end
   end
   return counter
 end

 def current_player
   turns = turn_count % 2
   if turns == 0
     return "X"
   else
     return "O"
 end
 end


def turn

puts "Please enter 1-9:"
input = gets.strip
index = input_to_index(input)
if valid_move?(index) == true
  token = current_player
  move(index, token)
  display_board

else
  puts "Please enter 1-9:"
  turn

end
end

def won?
if @board.all? == " " || @board.all? == nil
  return nil
else
WIN_COMBINATIONS.detect do |win|
@board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X" ||
@board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"

  end
end
end

def full?
  @board.none?  {|i| i == " " || i == ""}
end

def draw?
  if  won? == nil && full? == true
    return true
  end
end

def over?
if won? != nil || draw? == true
  return true
end
end

def winner
if over? == true && won? != false
  return @board[won?[0]]
else
  return nil
end
end

def play
until over? == true
  turn
end
if draw? == true
  puts "Cat's Game!"
elsif won? != nil
  v = winner
  puts "Congratulations #{v}!"

end
end

end
