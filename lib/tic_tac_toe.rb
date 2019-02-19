board = Array.new(9, " ")

class TicTacToe
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

  def input_to_index(user_input)
    user_input.to_i - 1
  end


def move(index, value)
  @board[index] = value
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
 index.between?(0, 8) && !position_taken?(index)
end

def turn_count
    @board.count{|token| token == "X" || token == "O"}
end

def turn
  puts "Please enter 1-9:"
  user_input = gets
  index = input_to_index(user_input)
  if valid_move?(index) == true
   move(index, value = current_player)
   display_board
 else
     turn
   end
 end

def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
 end

 def won?
  WIN_COMBINATIONS.each do |win_combination|
  if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
    return win_combination
  elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
    return win_combination
  end
 end
 false
end

def full?
  @board.each do |full|
    if full == " "
     return false
    end
  end
end

def draw?
  !won? && full?
end

def over?
    if draw?
     true
   elsif !!won?
     true
 end
end

def winner
if won?
  return @board[won?[0]]
else
  return nil
 end
end

def play
  until over?
    turn
  end
    won?
     puts "Congratulations #{winner}!"
    draw?
     puts "Cat's Game!"
end

end
