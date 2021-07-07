class TicTacToe

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

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
    "#{input}".to_i - 1
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    user_index = input_to_index(user_input)
    if valid_move?(user_index) == true
      move(user_index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0

    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end

    counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    #iterate over the WIN_COMBINATIONS constant. Check those indexes within the board. If they are occupied and everything is the same, return won.

    WIN_COMBINATIONS.detect do |combination|

      position_1 = combination[0]
      position_2 = combination[1]
      position_3 = combination[2]

      @board[position_1] == @board[position_2] &&
      @board[position_2] == @board[position_3] &&
      position_taken?(position_1)
    end
  end

  def full?
    @board.all? do |token|
      token == "X" || token == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      winning_array = won?
      @board[winning_array[0]]
    elsif !won?
      nil
    end
  end

  def play
    #until the game is over
    until over?
    #take turns
      turn
    #end
    end

    #if the game was won
    if won?
      puts "Congratulations #{winner}!"
    #congratulate the winner
    #else if the game was draw
    elsif draw?
    #tell the players it ended in a draw
      puts "Cat's Game!"
    #end
    end
  end

end
