class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  # Horizontal Wins
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
  # Vertical Wins
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
  # Diagonal Wins
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

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    (index.between?(0, 8) && !position_taken?(index)) ? true : false
  end

  def turn_count
    @board.count { |token| token == "X" || token == "O" }
  end

  def current_player
    turn_count % 2 === 0 ? "X" : "O"
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
    false if board_empty? === true

    WIN_COMBINATIONS.each do |win_combination|
      if (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X")
        return win_combination
      elsif (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
        return win_combination
      else
        next
      end
    end
    return false # Draw : board not empty and no winning combinations
  end

  def full?
    !spaces?
  end

  def draw?
    return false if !full? # game in progressas

    case won?
    when [0, 1, 2] # won in first row
      return false
    when [0, 4, 8] # won in L diagonal
      return false
    when [2, 4, 6] # won in R diagonal
      return false
    when false
      return true # draw
    end
  end

  def over?
    return true if draw?
    return true unless won? == false
    return false if spaces?
  end

  def winner
    return nil if draw?

    unless won? === false
      winning_combo = won?
      return @board[winning_combo[0]]
    end
  end

  def play
    until over? do
      turn
    end
    unless winner == nil
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def spaces?
    @board.any? { |element| element == " " || element == " "}
  end

  def board_empty?
    @board.all? { |element| element == " " || element == ""}
  end

end
