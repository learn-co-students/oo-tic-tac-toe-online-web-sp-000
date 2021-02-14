class TicTacToe
  attr_accessor :board

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
 index = user_input.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
if @board[index] == "X" || @board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    true
  else
    false
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
    "X"
  elsif
    turn_count % 2 == 1
    "O"
  end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if !valid_move?(index)
    turn
  else
    move(index, current_player)
  end
  display_board
end

def won?
  WIN_COMBINATIONS.each do |win|
    if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
      return win
    elsif
      @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
      return win
    end
  end
    return false
  end

def full?
  @board.all? do |board|
    board == "X" || board == "O"
  end
end

def draw?
  !won? && full?
end

def over?
  if draw? || won?
    return true
  else
    false
  end
end

def winner
  if
    draw? || !full? && !won?
    return nil
elsif @board[won?[0]] == "X"
    return "X"
  elsif
    @board[won?[0]] == "O"
    return "O"
  end
end

def play
  while !over? && !won? && !draw?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  end

  if draw?
    puts "Cat's Game!"
  end
end

end
