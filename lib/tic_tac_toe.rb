class TicTacToe
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
  def initialize
    @board = Array.new(9," ")
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
def move(position,player)
  @board[position] = player
end
 def position_taken?(index)
   if (@board[index] == "" || @board[index] == " " || @board[index] == nil)
        false
    else
        true
    end
end
 def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end
def turn
  puts 'Please enter 1-9:'
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index,current_player)
    display_board
  else
    turn
  end
end
 def turn_count
counter = 0    
@board.each do |position|
    if (position == "X" || position == "O")
		counter+=1 
    
    end
end
    counter
  end
def current_player
 if turn_count  % 2 != 0
   "O"
 else 
   "X"
end
end
def won?
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all?{ |i| @board[i] == "X"} || win_combo.all?{ |i| @board[i] == "O"}
     return win_combo
    end
  end
  false
end
def full?
  @board.all?{|v| v== "X" || v == "O"}
end
def draw?
  full?&& !won?
end
def over?
  won? || draw? || full?
end
def winner
  if win_combo = won?
    winner = @board[win_combo.first]
  end
  winner
end
def play
   turn until over?
  if won?
    puts  "Congratulations #{winner}!"
  else  draw?
    puts "Cat's Game!"
 
  end
end
end