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
    input.to_i - 1
  end

  def move(index, value = "X")
    @board[index] = value
    @board
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move? (index)
    if position_taken?(index) == false && index.between?(0, 8)
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |pos|
      if !(pos === " ")
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 === 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      value = current_player
      move(index, value)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if (@board[combo[0]] === "X" && @board[combo[1]] === "X" && @board[combo[2]] === "X") || (@board[combo[0]] === "O" && @board[combo[1]] === "O" && @board[combo[2]] === "O")
        return combo
      end
    end
    false
  end

  def full?
    @board.none?{|i| i === " "}
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    if draw?
      true
    elsif won?
      true
    else
      false
    end
  end

  def winner
    winning_combo = won?
    if winning_combo == false
      nil
    else
      @board[winning_combo[0]]
    end
  end

  def play
    if over?
      winnerpiece = winner
      if winnerpiece == nil
        puts "Cat's Game!"
      else
        puts "Congratulations #{winnerpiece}!"
      end
    else
      turn
      play
    end
  end

end
