class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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
  if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
    taken = false
  else
    taken = true 
  end
end

def valid_move?(index)
  position_taken?(index) == false && index.between?(0, 8)
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

def turn_count
   counter = 0 
   @board.each do |board|
   if board == "X" || board == "O"
    counter += 1 
  end
  end
  counter
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.find do |win|
    @board[win[0]] == @board[win[1]] &&
    @board[win[1]] == @board[win[2]] &&
    position_taken?(win[0])
  end
end

def full?
  @board.all?{|char| char == "X" || char == "O"}
end

def draw?
 full? && !won?
end

def over?
  won? || draw? || full?
end

def winner
  if win = won?
    @board[win[0]]
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

