class TicTacToe

  def initialize(board =[" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
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
    index = input.to_i - 1
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      return true
    else
      return false
    end
  end

  def turn_count
  counter = 0
    @board.each do |count|
      if count == "X" || count == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
   turn = turn_count
    if turn.even?
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    elsif !valid_move?(index)
      until valid_move?(index)
       puts "Please enter 1-9:"
       input = gets
       index = input_to_index(input)
      end
      move(index, current_player)
    end
    display_board
  end

=begin
  def won?
    WIN_COMBINATIONS.each do |win|
      if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
        return win
      elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
        return win
      end
    end
    i = 1
    for empty_board in @board
      if position_taken?(i)
      return false
       i += 1
      end
    end
    if !full?
      return false
    end
  end
=end

def won?
  WIN_COMBINATIONS.each do |win|
    if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
      return win
    elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
      return win
    end
  end
  if full?
    return false
  elsif !full?
    return false
  end
end

  def full?
    i = 0
    until i == @board.length
      if position_taken?(i)
        full_board = true
      else
        return false
      end
      i += 1
    end
    return full_board
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      winner = won?
      if @board[winner[0]] == "X" && @board[winner[1]] == "X" && @board[winner[2]] == "X"
        return "X"
      elsif @board[winner[0]] == "O" && @board[winner[1]] == "O" && @board[winner[2]] == "O"
        return "O"
      end
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
