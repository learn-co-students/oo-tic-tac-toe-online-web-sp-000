class TicTacToe
attr_accessor :board,:TicTacToe 


WIN_COMBINATIONS = [ 
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[6, 4, 2]
] 

 
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "] 
  end 
 
 
def play(board)
  puts "Please select a number" 
  user_input = gets.chomp
  game = TicTacToe.new 
end 


def over?
  
end 


def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "------------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "------------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end 

def input_to_index(user_input)
  index = user_input.to_i 
  array_index = index-1
end 



def move(board, array_index) 
  puts board [0, "X"]
  puts board[4, "O"]
end 


 
def position_taken?(board)
    if board[index] == nil || board[index] == ""
      false 
      true 
    end 
end 


def valid_move?
  index.between?(0,8) && !position_taken(board, index)
end 
 
 
 
 def turn_count
end 


def current_player
  
end 


def turn 
  input_to_index
  valid_move?
  current_player
end 


def won?
  
end 


def full?
  
end 


def draw?
end 


def over?
  if game.draw?
    puts "Game is over"
  end 
  
  if game.won?
    puts "You won"
  end
end 




end 