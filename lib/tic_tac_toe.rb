class TicTacToe

  # creates new board or sets it equal to existing board
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # defines all possible winning combinations
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]

  # displays the board array as a tic tac toe board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # converts user input (position) into an array position (index)
  def input_to_index(input)
    input.to_i - 1
  end

  # takes the user token (X or O) and adds it to the board index
  def move(index, token = "X")
    @board[index] = token
  end

  # returns TRUE if the user selected index is empty, if taken, returns FALSE
  def position_taken?(index)
    @board[index] != " "
  end

  # TRUE if the position is taken and in a valid TTT position, else FALSE
  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  # /////// TURN ///////
  # ask for input
  # translate input into index
  # sets the token to the current player
  # if valid_move?
  # => make the move for index
  # => display board
  # else
  # call turn again
  # end

  def turn
    puts "Please enter 1-9."
    input = gets.chomp
    index = input_to_index(input)
    token = current_player
    #binding.pry
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end

  # checks every index, TRUE if not empty, returns count
  def turn_count
    count = 0
    @board.each do |token|
      if token != " "
        count += 1
      end
    end
    count
  end

  # keeps track of who's turn it is based on turn count
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  # checks all of the WIN_COMBINATIONS, determines if all are taken by either X or O
  def won?
    WIN_COMBINATIONS.detect do |winning_combo|
      win_position_1 = @board[winning_combo[0]]
      win_position_2 = @board[winning_combo[1]]
      win_position_3 = @board[winning_combo[2]]

      win_position_1 == "X" && win_position_2 == "X" && win_position_3 == "X" ||
      win_position_1 == "O" && win_position_2 == "O" && win_position_3 == "O"
    end
  end

  # checks to see if the board is full - with either X or O, if yes, return true
  def full?
    @board.all? do|index|
      index == "X" || index == "O"
    end
  end

  # returns true for draw, returns false for game won, returns false for game in-progress
  def draw?
    full? && !won?
  end

  # returns true for draw, returns true for game won, returns false for game in-progress
  def over?
    draw? || won?
  end

  # returns X when X won, returns O when O won, returns nil when no winner
  def winner
    if won?
      @board[won?[0]]
    end
  end

  # primary method - plays the game until its won or draw
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
