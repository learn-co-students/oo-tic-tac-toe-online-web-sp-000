class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(number)
 number.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board [index] == nil
    false 
  else
    true 
  end
end

def valid_move?(index)
  if index.between?(0, 8) && @board[index] != "X" && @board[index] != "O"
    true
  else
    false
  end
end

def turn_count
  counter = 0 
   @board.each do |token|
     if token == "X" || token == "O"
    counter += 1 
   end
  end
 counter
end

def current_player
  if turn_count % 2 == 0 
    return "X"
  elsif turn_count % 2 != 0 
    return "O"
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  
  if valid_move?(index) == true
    value = "X" || value == "O"
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
 WIN_COMBINATIONS.detect do |win_combination|
   combo1 = win_combination[0]
   combo2 = win_combination[1]
   combo3 = win_combination[2]
  @board[combo1] == @board[combo2] && @board[combo2] == @board[combo3] && @board[combo1] != " "
 end
end

def full?
  @board.none? {|space| space == " "}
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  win_combination = won?
  if win_combination
   winning_location = win_combination[0]
   @board[winning_location]
  end
end

def play
 until over? 
   turn
  end 
   
 if won?
   winner == "X" || winner == "O" 
   puts "Congratulations #{winner}!" 
 elsif draw?
   puts "Cat's Game!" 
   end 
end
  
end