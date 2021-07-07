require "pry"
class TicTacToe
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
  ]
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

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

  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)

    if position_taken?(index) == false && index.between?(0,8)
      true
    else
      false
    end
  end

  def move(location, player = "X")
      @board[location] = player
  end



  def turn
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        puts "invalid"
        turn
      end
    end

  def won?
      WIN_COMBINATIONS.each do |win_combo|
        index_1 = win_combo[0]
        index_2 = win_combo[1]
        index_3 = win_combo[2]

        element_1 = @board[index_1]
        element_2 = @board[index_2]
        element_3 = @board[index_3]

        if element_1 == "X" && element_2 == "X" && element_3 == "X" || element_1 == "O" && element_2 == "O" && element_3 == "O"
          return win_combo
        end
      end
    @board.any? == "X" || @board.any? == "O"
  end

  def full?
    @board.all? {|element|element == "X" || element == "O"}
  end

  def draw?
      !won? && full?
  end

  def over?
      won? || draw? || full?
  end

  def winner
  if win_combo = won?
    return @board[win_combo[0]]
  end
end

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
