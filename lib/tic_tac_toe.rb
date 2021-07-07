class TicTacToe
  
attr_accessor :board

WIN_COMBINATIONS = [
  [0,1,2], #top row 
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column 
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal 1 
  [2,4,6], # diagonal 2
  ]

 def initialize(board = nil)
   @board = board || Array.new(9, " ")
 end

def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index=input.to_i
  index -= 1
end

def move(index, char)
  board[index] = char
end

def position_taken?(index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(index)
  return true if index.between?(0,8) && !position_taken?(index) 
end

def turn
  char = current_player
  puts "Please enter 1-9:"
  input = gets.strip
  index=input_to_index(input)
  if valid_move?(index)
    move(index, char)
    display_board
  else turn
  end
end

def turn_count
  counter = 0 
  board.each do |space|
    if space != " "
    then counter += 1 
    end
  end
  return counter
end

def current_player
  if (turn_count % 2 == 0) then return "X"
  elsif (turn_count % 2 == 1) then return "O"
  end  
end

def won?
  WIN_COMBINATIONS.any? do |win_combination|
   if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" 
     return win_combination
    elsif board[win_combination[0]]== "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
     return win_combination
   else 
     false 
    end
  end
end

def full?
  if board.any?{|element| element == " " } then return false
  else 
  return true
  end
end

def draw?
  if (won? == false && full? == true)
  then return true
  end
end

def over?
  if draw? == true || (won? != false && full? == true) || (won? != false && full? != true) 
    then return true
  end
end
  
def winner
  WIN_COMBINATIONS.detect do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" 
      puts "X"
      return "X"
    elsif board[win_combination[0]]== "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      puts "O"
      return "O"
  end
  end
end

def play
  until over? == true
  turn
end
  if won? != false
    puts "Congratulations #{winner}!" 
  elsif draw?
    puts "Cat's Game!"
  end
end





end