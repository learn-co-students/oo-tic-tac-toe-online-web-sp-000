class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Top column
    [1,4,7], # Middle column
    [2,5,8], # Bottom column
    [0,4,8], # Diag A
    [6,4,2], # Diag B
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

  # code your input_to_index and move method here!
  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index,character)
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  #valid_move?
  def valid_move?(index)
    if ( index.between?(0,8) && position_taken?(index) == false)
      return true
    end
  end

  #turn_count
  def turn_count
    counter = 0
    @board.each do |index|
      if !(index.nil? || index == " ")
        counter += 1
      end
    end
    return counter
  end

  #current_player
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  #turn
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else turn
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |win_state|
      if (win_state.all? {|index| position_taken?(index)}) && (win_state.all? {|index| @board[index] == "X"} || win_state.all? {|index| @board[index] == "O"})
        return win_state
      end
    end
  end

  def full?
    return_value = true
    @board.each do |index|
      if (index.nil? || index == " ")
        return_value = false
      end
    end
    return return_value
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    if won? || draw? || full?
      return true
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
        puts "Congratulations #{winner}!"
    end
  end
end
