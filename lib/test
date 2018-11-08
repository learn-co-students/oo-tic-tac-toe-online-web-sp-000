class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
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

  def input_to_index(user_input)
    @index = "#{user_input}".to_i
  return @index - 1
end
def move(index, character = "X")
    @character = character
    @board[index] = character
end
def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    return false
  end
  if @board[index] == "X" || @board[index] == "O"
    return true
  end
end
def valid_move?(index)
  if position_taken?(index) == false && index.between?(0,8)
    return true
  else
  return nil
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

def turn_count
  counter = 0
  @board.each do |turn|
    @turn = turn
    if turn == "X" || turn == "O"
      counter += 1
    else
      counter += 0
    end
  end
  return counter
end
def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.find do |win_combination|
    position_1 = @board[win_combination[0]]
    position_2 = @board[win_combination[1]]
    position_3 = @board[win_combination[2]]
    (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
      (position_1 == "O" && position_2 == "O" && position_3 == "O")
  end
end

def full?
  @board.all? {|character| character == "X" || character == "O"}
end
 def draw?
  full? && !won?
end
 def over?
  won? || full?
end
 def winner
  combo = won?
  if combo
    @board[combo[0]]
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
def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
