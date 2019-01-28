class TicTacToe
  
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

attr_accessor :board

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  
 def input_to_index(input)
   
   index = input.to_i - 1
   index
 end
 
 

  def position_taken?(index)
    @board[index] != " "
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
#def play
  
 # if over? == false 
#    turn 
#    over?
#  elsif won?
#  puts "Congratulations #{winner}!" 
#elsif draw? 
#puts "Cat's Game!"
#end 
#end
 def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

 def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end

def turn
 
  puts 'Please enter 1-9:'
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index)
    display_board
  else
    turn
  end

end
def move(index, player = current_player)
  board[index] = player
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

  def full?
    @board.all?{|square| square != " " }
  end


def draw?
  full? && !won?
end

def over?
  won? || draw?
end

 def winner
    if combo = won?
      @board[combo[0]]
    end
  end
end