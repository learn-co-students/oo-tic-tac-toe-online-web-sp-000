class TicTacToe
  
def initialize(board = nil)
   @board = board || Array.new(9, " ")
end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
  
def input_to_index(string)
  string.to_i - 1
end
    
def move(index,character = "X")
  @board[index] = character
end
  
def position_taken?(index)
@board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
  if @board[index] == " " && index >= 0 && index <= 8
    return true
  else
    false
end
end

def turn_count
  counter = 0
  @board.each do |move|
    if move == "X" || move == "O"
    counter += 1
end 
end
return counter
end 

def current_player
  move = turn_count
  if move % 2 == 0
    return "X"
  else
  return "O"
end 
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

def won?
  WIN_COMBINATIONS.find do |win_combination|
  @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
end 
end
  
def full?
  @board.all? do |token|
    token == "X" || token == "O"
  end  
end 
  
  def draw?
   !won? && full?
  end 
  
  def over?
  won? || draw?
end

def winner
  WIN_COMBINATIONS.each do |win_combination|
 if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
   return "X"
 elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" &&@board[win_combination[2]] == "O"
 return "O"
end
end
return nil
end 

def play
  until over?
  turn
  end
 if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
 else draw?
    puts "Cat's Game!"
end
end
   
end 