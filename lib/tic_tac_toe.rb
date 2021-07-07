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
  [2,4,6]
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
def move(index, current_player = "X")
  @board[index] = current_player
  if current_player == "X" || "O"
   return true
 else
   return false
 end
end
def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end
def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end
def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def turn
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end
def won?
empty_board = @board.all? {|empty| empty == " "}
draw = @board.all? {|token| token == "X" || token == "O"}
WIN_COMBINATIONS.any? do |win_combo|
  if win_combo.all? {|index| @board[index] =="X" } || win_combo.all? {|index| @board[index] =="O"}
     return win_combo
  else empty_board || draw
      false
    end
  end
end
def full?
  @board.all? { |space| space == "X" || space == "O"}
end
def draw?
  if won?
    return false
  elsif !won? && full?
    return true
  else
    return false
  end
end
def over?
  if won? || draw? || full?
    return true
  else
    return false
  end
end
def winner
  index = []
  index = won?
    if index == false
      return nil
    elsif
      @board[index[0]] == "X"
        return "X"
    else
      return "O"
    end
end
def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
  end
end
end
