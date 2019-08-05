class TicTacToe

def initialize(board = nil)
@board = board  || Array.new(9, " ")
end

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
user_input.to_i-1
end

def move(index, char="X")
@board[index] = char
end

def position_taken?(index)
if @board[index] == " " || @board[index] == "" || nil
return false
else
return true
end
end

def valid_move?(index)
index.between?(0, 8) && !position_taken?(index)
end

def turn_count
  counter = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
      "#{counter}"
    end
  end
counter
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
  token = current_player
  move(index, token)
  display_board
else
  puts "Oh, no! Looks like you gave an invalid move. Please try again."
  turn
end
end

def won?
  WIN_COMBINATIONS.detect do |win_coordinates|
    win_index_1 = win_coordinates[0]
    win_index_2 = win_coordinates[1]
    win_index_3 = win_coordinates[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    position_1 == "X" && position_2 == "X" && position_3 == "X" ||
    position_1 == "O" && position_2 == "O" && position_3 == "O"
    end
end

def full?
  @board.all? do |position|
    position == "X" || position == "O"
end
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  if won?
    @board[won?[0]]
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
