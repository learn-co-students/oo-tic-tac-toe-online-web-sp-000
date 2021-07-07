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

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  @board[index] != " " && @board[index] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
counter = 0
@board.each do |space|
if space == "X" || space == "O" then counter += 1
    end
  end
counter
end

def current_player
player = "X"
  if turn_count % 2 == 0 then player = "X"
  else player = "O"
end
player
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
      return win_combination
    elsif
      @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
      return win_combination
    else
      false
    end
  end
  false
end


def full?
  @board.none?{|space| space == " "}
end

def draw?
  won? == false && full? == true
end

def over?
won? || draw?
end

def winner
if won? == false then nil else
win_array = won?
@board[win_array[0]]
end
end

def play
  while over? == false
    turn
  end
  if draw? == true then puts "Cat's Game!"
  else puts "Congratulations #{winner}!"
  end
end

end
