require "pry"

class TicTacToe
attr_accessor :board, :current_player, :selection_index
attr_reader  :game_status

def initialize
  @board=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
#  puts @board

end

#binding.pry
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom column
  [0,3,6],  # left column
  [1,4,7],  # cented column
  [2,5,8],  # right column
  [0,4,8],  # diagonal 1
  [2,4,6]  # diagonal 2
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input = input.to_i
  input-1
end

def move
  @board[@selection_index]=@current_player
end

def position_taken?
  @board[@selection_index] != " "
end

def good_number
  @selection_index>=0 && @selection_index<=8
end


def valid_move?
  good_number && !position_taken?
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count.even? ? "X" : "O"
end

def ask_for_selection
  puts "Please enter a number 1-9:"
  @selection_index = input_to_index(gets)
end

def turn
    ask_for_selection
  until valid_move?
    ask_for_selection
  end
  move
  display_board
end


def X_win?
  WIN_COMBINATIONS.select do |winning_combination|
    winning_combination.all? do |value|
      @board[value]=="X"
    end
  end[0]
end

def O_win?
  WIN_COMBINATIONS.select do |winning_combination|
    winning_combination.all? do |value|
      @board[value]=="O"
    end
  end[0]
end

def won?
  if X_win? == nil && O_win? == nil
    nil
  elsif X_win? == nil
    O_win?
  else
    X_win?
end


def full?
  @board.none? {|letter| letter==" "}
end

def empty_spots?
  !full?
end

def draw?
  if won?
    false
  elsif empty_spots?
    false
  else
    true
  end
end

def over?
  draw? || won?
end

def winner
  if X_win?
    "X"
  elsif O_win?
    "O"
  else
    nil
  end
end

def play
  until over?
    turn
  end
  if draw?
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner}!"
  end
end

end
end
