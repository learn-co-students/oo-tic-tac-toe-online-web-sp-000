require 'pry'
class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

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

  def input_to_index(num)
     num.to_i - 1
  end

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(index)
    !position_taken?(index) && (0..8).include?(index) ? true : false
  end

  def turn_count
    counter = 0
    @board.each {|character| character == "X" || character == "O" ? counter += 1 : nil}
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    result = nil
    WIN_COMBINATIONS.each do |win_combo|
      win = win_combo.all?{|index| @board[index] == "X"}
      win ? result = win_combo : result
    end

    WIN_COMBINATIONS.each do |win_combo|
      win = win_combo.all?{|index| @board[index] == "O"}
      win ? result = win_combo : result
    end
  result
  end

  def full?
    @board.all? {|character| character == "X" || character == "O"}
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    arr = won?
    arr ? @board[arr[0]] : nil
  end

  def play
    message = nil
    until over?
     turn
    end
    won? ? message = "Congratulations #{winner}!" : message = "Cat\'s Game!"
    puts message
  end
end
