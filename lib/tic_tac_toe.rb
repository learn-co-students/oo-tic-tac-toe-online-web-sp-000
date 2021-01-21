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

  puts " #{board[3]} | #{board[4]} | #{board[5]} "
 
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end 

def input_to_index(user_input)
  index = user_input.to_i 
  array_index = index-1
end 



def move(board, index) 
end 
end 
 