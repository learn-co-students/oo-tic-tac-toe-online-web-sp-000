class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

  CHARACTER_SET = ["X", "O"]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    board = self.board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    self.board[index] = current_player
  end

  def position_taken?(index)
    !(self.board[index].nil? || self.board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !self.position_taken?(index)
  end

  def turn_count
    turn = 0
    self.board.each do |spot|
      if spot != " " && spot != "" && spot != nil
        turn += 1
      end
    end
    turn
  end

  def current_player
    turn  = self.turn_count
    if turn % 2  == 0 #is even
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = self.input_to_index(input)
    if self.valid_move?(index)
      self.move(index, self.current_player)
    else
      self.turn
    end
    self.display_board
  end

  #------- win helper methods --------

  #Returns true if the board has a win on it and false if it does not
  def won?
    self.any_winning_combination
  end

  #Iterates through all of the WIN_COMBINATIONS and see if there is a winning combination
  def any_winning_combination
    WIN_COMBINATIONS.detect do |combination|
      self.any_char_combo?(combination)
    end
  end

  #Checks winning_combo? for all characters
  def any_char_combo?(combination)
    CHARACTER_SET.any? do |character|
      self.winning_combo?(combination, character)
    end
  end

  def position_taken_spot?(spot)
    spot != " " && spot != "" && spot != nil
  end

  def full?
    self.board.all? {|spot| self.position_taken_spot?(spot)}
  end

  #Sees if there is a win for a specific combination, board, and character.
  def winning_combo?(combination, character = "X")
    combination.all? do |index|
      self.board[index] == character
    end
  end

  def draw?
    !self.won? && self.full?
  end

  def over?
    self.draw? || self.won? || self.full?
  end

  def winner
    win = self.won?
    win ? self.board[win[0]] : nil
  end

  def play
    until self.over? do
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end

end
