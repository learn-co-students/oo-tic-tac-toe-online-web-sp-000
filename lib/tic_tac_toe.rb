class TicTacToe
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, character)
    @board[index] = character
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
     true
    else
    end
  end
  
 def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  
  user_index = input_to_index(user_input)
    if valid_move?(user_index)
      move(user_index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    @board.count {|character| character == "X" || character == "O"}
  end

def current_player
   turn_count.even? ? "X" : "O"
end
  
def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
  end
end 

def full?
  @board.all?{|token| token == "X" || token == "O"}
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  if winning_combination = won?
    @board[winning_combination.first]
  end
end
  
def play
  turn until over?
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
  
end 