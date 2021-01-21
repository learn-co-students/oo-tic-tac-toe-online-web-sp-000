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


end 
 
 
 