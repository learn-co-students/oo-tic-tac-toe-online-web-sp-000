class TicTacToe
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

  def initialize(board = nil)
    @board = board || @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(number)
    number.to_i - 1
  end

  def move(index, player_token)
    @board[index] = player_token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0, 8) && @board[index] == " "
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter a number from 1 to 9"
    number = gets.chomp
    index = input_to_index(number)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.map { |index| @board[index] }.count("X") == 3
        return combo
      elsif combo.map { |index| @board[index] }.count("O") == 3
        return combo
      end
    end
    false
  end

  def full?
    @board.include?(" ") ? false : true
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    turn until over?
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end
end