class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board
    @board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

# Define your WIN_COMBINATIONS constant
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

def input_to_index(user_input)
  user_input.to_i - 1
end

def input_to_index
  @input_to_index
end

def move(index, value)
    @board[index.to_i] = value
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  if position_taken?(index) != true && index.between?(0,8)
    true
  else
    false
  end
end

def turn
  if !over?
    puts "Please enter 1-9:"
    user_input = gets.strip
    puts "Please chose token 'X' or 'O':"
    value = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index,value)
      display_board
    else
      puts "invalid number entry, please try again"
      turn
    end
  else
    nil
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end



def turn_count
  @board.count do |marker|
    marker == "X" || marker == "O"
  end
end

def current_player
  if turn_count(@board).even?
    "X"
  else
    "O"
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
  @board.all?{|marker| marker == "X" || marker == "O"}
end

def draw?
  full? && !won?
end

def over?
  won? || full?
end

def winner
  if winning_combo = won?
    @board[winning_combo.first]
  end
end

def play
  games = 1
  while games < 10
    turn
    games +=1
  end
end

end
