class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
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
    @board.each do |space|
      if space == "X" || space == "O"
        turns += 1
      end
    end
    return turns
  end

  def current_player
    number_of_turns = turn_count
    if number_of_turns % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |winning_combination|
      if (@board[winning_combination[0]] == "X" && @board[winning_combination[1]] == "X" && @board[winning_combination[2]] == "X" || @board[winning_combination[0]] == "O" && @board[winning_combination[1]] == "O" && @board[winning_combination[2]] == "O")
        return winning_combination
      end
    end
    return false
  end


  def full?
    @board.all? { |x| x == "X" || x == "O"}
  end

  def draw?
    !won? && full?
    if full? && !won?
      return true
    elsif !won? && !full? || !won?
      return false
    end
  end

  def over?
    if draw? || full? || won?
      return true
    else
      return false
    end
  end

  def winner
    if !won?
      return nil
    else
      winning_combination = won?
      return @board[winning_combination[0]]
    end
  end

  # Define your play method below
  def play
    until over?
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end

end
