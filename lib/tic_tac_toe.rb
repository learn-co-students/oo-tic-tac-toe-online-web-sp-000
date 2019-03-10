class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

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

  def move(position, character)
    @board[position] = character
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn_count
    @board.count { |token| token == "X" || token == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please choose the location of your next move (1-9)"
    move_location = gets.strip
    move_location = input_to_index(move_location)
    if valid_move?(move_location)
      move(move_location, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if (@board[combo[0]] == "X" || @board[combo[0]] == "O") &&
        (@board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]])
        return combo
      end
    end
    return false
  end

  def full?
    @board.all? { |token| token == "X" || token == "O" }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end
    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
