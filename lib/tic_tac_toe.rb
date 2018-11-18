class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, token)
    @board[position] = token
  end

  def position_taken?(position)
    @board[position] != " "
  end

  def valid_move?(position)
    position_taken?(position) == false && position.between?(0, 8)
  end

  def turn
    puts "Please choose a number between 1-9:"
    user_input = gets.strip
    idx = input_to_index(user_input)
    if valid_move?(idx)
      move(idx, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.select {|ele| ele == "X" || ele == "O"}.length
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] &&
      @board[win_combo[1]] == @board[win_combo[2]] &&
      @board[win_combo[2]] != " "
    end
  end

  def full?
    turn_count == 9
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won? || full?
  end

  def winner
    if win_combo = WIN_COMBINATIONS.detect { |combination|
      @board[combination[0]] == @board[combination[1]] &&
      @board[combination[1]] == @board[combination[2]] &&
      @board[combination[2]] != " "}
      @board[win_combo[0]]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
