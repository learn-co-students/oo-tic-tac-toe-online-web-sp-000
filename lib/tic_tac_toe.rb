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
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else @board[index] != " "
      false
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) != true
      true
    else
    end
  end

  def turn_count
    counter = 0
    9 - @board.count(" ")
  end

  def current_player
    counter = 0
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:" #ask for user input
    user_input = gets.strip #gets user input
    index = input_to_index(user_input) #translate input into idex
    if valid_move?(index) #checks if move is valid
      move(index, current_player) # if move is valid, make move
      display_board #display board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      location1 = win_combination[0]
      location2 = win_combination[1]
      location3 = win_combination[2]

      @board[location1] == @board[location2] && @board[location2] == @board[location3] && @board[location1] != " "
    end
  end

  def full?
    @board.none? { | position | position == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    win_combination = won?
      if win_combination
        winning_location = win_combination[0]
        @board[winning_location]
      else
        nil
      end
  end

  def play
    turn until over?
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end

end
