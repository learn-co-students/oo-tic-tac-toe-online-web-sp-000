class TicTacToe

attr_accessor :board, :index, :board, :value, :input

WIN_COMBINATIONS= [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end


def display_board
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
# "-----------", "   |   |   ", "-----------", "   |   |   "
end

def valid_move?(index)
   if index.between?(0,8) && !position_taken?(index)
     return true
   else
     return false
   end
end
# # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
#
def input_to_index(input)
  input.to_i - 1
end
#
def move(index, value)
  @board[index] = current_player
end


def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, value)
    # move(board, index, value = "X")
    display_board
  else
    turn
end
end

def turn_count
turn = 0
board.each do |player|
  if player == "X" || player == "O"
    turn += 1
  end
  end
  turn
end

def current_player
  if turn_count.even?
    return "X"
  else turn_count.odd?
    return "O"
end
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

# WIN_COMBINATIONS= [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?
WIN_COMBINATIONS.each do |win|
  if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
    return win
  elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
    return win
  end
  end
  return false
end

def full?
    @board.all? do |position|
    position == "X" || position == "O"
    end
end


def draw?
  if full? == true && won? == false
    return true
  end
end

def over?
  if won? || full? || draw?
    return true
  end
end
#
def winner
  if over?
    return @board[won?[0]]
  end
end
#
def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw? == true
    puts "Cat's Game!"
  end
end

end
