class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize
    @board = Array.new(9, " ") # Creates an array with 9 elements filled with " "
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} \n"
    puts "-----------\n"
    puts " #{board[3]} | #{board[4]} | #{board[5]} \n"
    puts "-----------\n"
    puts " #{board[6]} | #{board[7]} | #{board[8]} \n"
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    board[index] = current_player
  end

  def position_taken?(location)
    board[location] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && position_taken?(index) == false
  end

  def turn_count()
    board.count{ |space| space != " " }
  end

  def current_player()
    # xPlayCount = board.count{ |position| position == "X" }
    # oPlayCount = board.count{ |position| position == "O" }
    # return_val = "X"
    # if oPlayCount < xPlayCount
    #   return_val = "O"
    # end
    # return_val
    if turn_count().even?
      "X"
    else
      "O"
    end
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def won?()
    returnVal = false
    WIN_COMBINATIONS.each do |win_combination|
      if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
        returnVal = win_combination
      elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
        returnVal = win_combination
      end
    end
    returnVal
  end

  def full?()
    true unless board.any?{|position| position == " "}
  end

  def draw?()
    if won?
      return false
    else
      if full?
        return true
      else
        return false
      end
    end
  end

  def over?()
    if won?
      return true
    elsif draw?
      return true
    else
      if full?
        return true
      else
        return false
      end
    end
  end

  def winner()
    if !won?
      nil
    else
      board[won?[0]]
    end
  end

  def play
    until over? do
      turn()
    end
    if !won?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
