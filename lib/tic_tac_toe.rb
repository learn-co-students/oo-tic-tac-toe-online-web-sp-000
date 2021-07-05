require "pry"

class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

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

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index >= 0 && index <= 8 && !position_taken?(index)
  end

  def turn_count
    @board.count {|position| position != " "}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    user_input = gets.strip
    index = input_to_index(user_input)
    valid_move?(index) ? move(index, current_player) && display_board :
      "invalid" && turn
  end

  def won?
    WIN_COMBINATIONS.find {|combo| position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]}
  end

  def full?
    @board.all? {|position| position != " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    # binding.pry
    won? || draw?
    # binding.pry
  end

  def winner
    if over? && !draw?
      @board[won?[0]]
    end
  end

  def play
    # binding.pry
    until over?
      # binding.pry
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
       puts "Cat's Game!"
    end
  end

end
