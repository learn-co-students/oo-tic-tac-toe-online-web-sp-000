require 'pry'

class TicTacToe

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input_int = input.to_i
    index = input_int - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    (not position_taken?(index)) && (index <= 8 && index >= 0)
  end

  def turn_count
    @board.count{|x| x != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      player = current_player
      move(index, player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |x|
      #compares the 3 values in array to each other to make sure they are all the same but excludes " "
      (@board[x[0]] == @board[x[1]]) && (@board[x[1]] == @board[x[2]]) && (@board[x[0]] != " ") ? (@winner = x) : false
    end
    @winner
  end

  def full?
    @board.all? {|x| x != " "}
  end

  def draw?
    full? && (not won?)
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board[@winner[0]] : nil
  end

  def play
    while (not over?)
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cat's Game!"
    else
    end
  end
end
