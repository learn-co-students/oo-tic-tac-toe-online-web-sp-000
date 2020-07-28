require 'pry'
class TicTacToe

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

  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

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

  def move(index,char="X")
    @board[index] = char
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    !(position_taken?(index)) && index.between?(0,8)
  end

  def turn_count
  @board.count{|space| space == "X" || space == "O"}
  end

  def current_player
    return "O" unless turn_count.even?
    "X"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    turn unless valid_move?(index)
      move(index, current_player)
      display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
       @board[win_combo[0]] == @board[win_combo[1]] &&
       @board[win_combo[1]] == @board[win_combo[2]] &&
       position_taken?(win_combo[0])
     end
   end

def full?
  @board.none?{|position| position == " " || position == nil}
end

def draw?
  !won? && full?
end

def over?
  draw? || won?
end

def winner
  if won?
    winner_index = won?[0]
    return @board[winner_index]
  end
end

def play
  until over? do
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end


end
