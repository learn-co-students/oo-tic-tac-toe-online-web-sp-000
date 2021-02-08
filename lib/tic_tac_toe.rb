class TicTacToe
  WIN_COMBINATIONS = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(index)
    if position_taken?(index) || index > 8 || index < 0
      false
    else
      true
    end
  end

  def turn_count
    turn_count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        turn_count += 1
      end
    end
    turn_count
  end

  def current_player
    self.turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    input = gets.chomp
    index = input_to_index(input)
    valid_move?(index) ? move(index, current_player) : input = gets.chomp
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X")
        win_combo
      elsif (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
        win_combo
      end
    end
  end

  def full?
    self.turn_count >= 9
  end

  def draw?
    self.full? && !self.won?
  end

  def over?
    self.draw? || self.won?
  end

  def winner
    self.won? ? @board[self.won?[0]] : nil
  end

  def play
    while !over?
      turn
    end
    puts "Congratulations #{self.winner}!" if self.won?
    puts "Cat's Game!" if self.draw?
  end
end
