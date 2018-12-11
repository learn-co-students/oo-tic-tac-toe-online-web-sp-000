require "pry"
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,4,8], # Diagonal1
    [6,4,2], # Diagonal2
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8]  # Right column
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

  def move(index,token = "X")
    @board[index] = token
  end

  def position_taken?(index) # if sopt is blank or nil then true
    !(@board[index] == " " || @board[index] == "")
  end

  def valid_move?(index) # if postion not taken and index between 0-8 then true
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    number = 0
    @board.each do |postion|
      if postion == "X" || postion == "O"
        number += 1
      end
    end
    return number
  end

  # def current_player
  #   turn_count % 2 == 0 ? "X" : "O"
  # end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      player = current_player
      move(index, player)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each {|win_combo|
      index_0 = win_combo[0]
      index_1 = win_combo[1]
      index_2 = win_combo[2]

      position_1 = @board[index_0]
      position_2 = @board[index_1]
      position_3 = @board[index_2]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    }
    return false
  end

  def full?
    # if turn_count == 9 && won == false
    #   return true
    @board.all? {|index| index == "X" || index == "O"}
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    won? || draw?
  end

  def winner
    winning_combo = []
    winning_combo = won?
    if winning_combo == false
      return nil
    else
      if @board[winning_combo[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def play
    until over? do
      turn
    end
    # binding.pry
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
