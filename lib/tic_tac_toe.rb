class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
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
def move(position, character)

   @board[position] = character
end
def position_taken?(integer)
  if @board[integer] == " " || @board[integer] == "" || @board[integer] == nil
   false
  elsif @board[integer] == "X" || @board[integer] == "O"
   true
  end
end
def valid_move?(index)
  if (index < 0 || index > 8)
    false
  elsif position_taken?(index)
    false
  else
    true
  end
end
def turn_count
  counter = 0
  @board.each do |space|
    if space == "X" || space == "O"
      counter += 1
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
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
  else
    turn
  end
  display_board
end
def won?
  WIN_COMBINATIONS.detect{|combo| @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])}
end
def full?
  if @board.include?(' ') || @board.include?('')
    return false
else
    return true
  end
end
def draw?
  if !won? && full?
   return true
 else won?
   return false
 end
end
def over?
  if draw? || full? || won?
    true
  else
    false
  end
end
def winner
  win_combo = won?
  if win_combo
    @board[win_combo[0]]
  else
    nil
  end
end
end
