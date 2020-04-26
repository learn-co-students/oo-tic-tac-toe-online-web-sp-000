class TicTacToe
  def initialize 
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS =[
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 4, 8], # diagnol
  [2, 4, 6], # diagnol
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  ]
  
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

def move (index, value = "X")
  @board[index]= value
end

def position_taken?(index)
  @board[index] == 'X' || @board[index] == 'O'
end

def valid_move?(index)
  index.between?(0, 8) && !position_taken?(index)
end

def turn_count
  @board.count {|token| token == "X" || token == "O"}
end

def current_player
  if turn_count % 2 == 0
    "X"
  else 
    "O"
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
  end
end
def full?
  @board.none? {|position| position == " "}
end

def draw?
  !won? && full?
end

def over?
  draw? || won?
end 

def winner
 if  winning_combo = won?
   @board[winning_combo[0]]
end
end

def play
 until over?
 turn
 end
 if won?
   puts "Congratulations #{winner}!"
 else 
   puts "Cat's Game!"
 end
end
end