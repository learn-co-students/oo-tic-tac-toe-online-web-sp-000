class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,4,8], # left diagonal
    [2,4,6], # right diagonal
    [0,3,6], # left col
    [1,4,7], # middle col
    [2,5,8] # right col
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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(index)
    index.between?(0, 8) && position_taken?(index) == false
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

  def turn_count
    count = 0
    @board.each do |i|
      if i != " "
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find do |win_array|
      win_array.all? {|i| @board[i] == "X"} || win_array.all? {|i| @board[i] == "O"}
    end
    # It tests in win_array is found in the WIN_COMBINATIONS, if found, returns the winning array, hense true; if not found, returns false.
  end

  def full?
    @board.any? {|i| i == " "} ? false : true
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over? || draw?
      turn
    end

    if won?
        puts "Congratulations #{winner}!"
    elsif draw?
        puts "Cat's Game!"
    end
  end

end
