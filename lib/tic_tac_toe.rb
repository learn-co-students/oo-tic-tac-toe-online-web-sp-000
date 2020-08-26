require 'pry'
class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

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

  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(position)
    if position.between?(0,8) == false
      false
    elsif @board[position] == "X" || @board[position] == "O"
      false
    else
      true
    end
  end


  def turn
    puts "Please enter your move"
    user_input = gets.chomp
    token = self.current_player
    index = input_to_index(user_input)
    until valid_move?(index) == true
      puts "Please enter your move"
      user_input = gets.chomp
      token = self.current_player
      index = input_to_index(user_input)
    end
    self.move(index, token)
    self.display_board
  end

  def turn_count
    @turn_count = 0
    @board.each do |position|
      @turn_count += 1 if position == "X" || position == "O"
    end
    @turn_count
  end


  def current_player
    @turn_count = self.turn_count
    if @turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 =="O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
      end
    end
    return false
  end

  def full?
    @board.all? do |box|
      box == "X" || box == "O"
    end
  end


  def draw?
    if self.full? == true && self.won? == false
      return true
    else
      return false
    end
  end

  def over?
    if self.won? != false || self.draw? == true || self.full? == true
      return true
    else
      return false
    end
  end


  def winner
    if self.won? != false
      win_combination = self.won?
      return @board[win_combination[0]]
    else
      return nil
    end
  end


  def play
    until self.over? == true
      self.turn
    end

    if self.winner == "X"
      puts "Congratulations X!"
    elsif self.winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
end
