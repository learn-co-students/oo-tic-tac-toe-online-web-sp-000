require 'pry'

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

class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
    return index
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

  def turn_count
    return 9 - @board.count(" ")
  end

  def current_player
    turn_count%2 == 0 ? "X" : "O"
  end

  def valid_move?(index)
    if !position_taken?(index) && index < 9 && index >= 0
      return true
    else
      return false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && @board[combo[0]] != " "
        return combo
      end
    end
    return false
  end

  def full?
    @board.count(" ") == 0 ? true : false
  end

  def draw?
    won? == false && full? ? true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    if won? != false
      return @board[won?[0]]
    else
      return nil
    end
  end

  def turn
    puts "Select a number between 1 and 9"
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Invalid input, please try again"
      turn
    end
  end

  def play
    display_board
    while !won? && !draw?
      turn
    end
    puts "Congratulations, #{winner}!"
  end
end
