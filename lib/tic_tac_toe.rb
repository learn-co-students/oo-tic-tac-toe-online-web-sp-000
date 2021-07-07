class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  def play
    display_board
    while !over? && !draw? #draw? method is obsolete but required by tests
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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
    turns = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turns += 1
      end
    end
    turns
  end

  def current_player
    turns = turn_count
    player = turns % 2
    if player == 0
      "X"
    elsif player == 1
      "O"
    end
  end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8],
  ]

  def won?
    WIN_COMBINATIONS.detect do |combination|
      combination.all?{|index| @board[index] == "X"} || 
      combination.all?{|index| @board[index] == "O"}
    end
  end

  def full?
    @board.all?{|index| index == "X" || index == "O"}
  end

  def draw?
    if full?
      !won?
    end
  end

  def over?
    full? || won?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end
end