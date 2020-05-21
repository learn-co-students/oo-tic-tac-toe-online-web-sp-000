#here are three test files that should be completed in order.
#require_relative '../spec/01_tic_tac_toe_spec.rb'
#tests for our helper methods within #TicTacToe. 
#02_play_spec.rb tests the main #play method. 
##03_cli_spec.rb tests the CLI

class TicTacToe
  
  
  
  WIN_COMBINATIONS = 
[
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
    @board = board || Array.new(9,' ')
 end
  
  
def display_board
  
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  
end
  
def input_to_index(input)
 index = input.to_i-1
end 


 def move(index, character="X")
@board[index] = character
end

def position_taken?(index, character= "X" || "O")
  if @board[index]== " " || @board[index]== ""
return  false
 elsif  @board[index]== nil || @board[index]= character
  return true 
end 
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    return true 
end 
end 

def turn
input = gets.strip
puts "Please enter a number 1-9:"
  index= input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end
  def turn_count
  @board.reject {|space| space == ' '}.length  
end 

def current_player
 if turn_count % 2 == 0 
   return "X"
   elsif turn_count % 2 != 0
   return "O"
 end 
end 

def won?
  WIN_COMBINATIONS.each do |win_comb|
    win_index_1 = win_comb[0]
    win_index_2 = win_comb[1]
    win_index_3 = win_comb[2]
    
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_comb
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_comb
    end
  end
  return false
end

def full?
@board.all? do |character| character == "X" || character == "O"
end
end

def draw?
if full? && !won?
  return true
end
end

def over?
 if  draw? || won?
   return true
end 
end

def winner
  win = won?
  if win == false
    return nil
  else
    if @board[win[0]] == "X"
      return "X"
    elsif @board[win[0]] == "O"
      return "O"
    end
  end
end

def play
until over?
 turn
 end
if won?
  puts "Congratulations #{winner}!"
  elsif draw?
  puts "Cat's Game!"
end
end 

end 